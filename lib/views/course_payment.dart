import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class CoursePayment extends StatefulWidget {
  const CoursePayment({super.key});

  @override
  State<CoursePayment> createState() => _CoursePaymentState();
}

class _CoursePaymentState extends State<CoursePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
        child: const Center(
          child: Column(
            children: [
              // payment notice
              Expanded(
                child: PaymentCard(),
              ),

              SizedBox(
                height: 10,
              ),

              // payment button
              PaymentDone(),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentCard extends StatefulWidget {
  const PaymentCard({
    super.key,
  });

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: const Color.fromARGB(255, 122, 120, 120),
      color: const Color.fromARGB(255, 249, 247, 250),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // icons
          Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: Align(
              alignment: Alignment.topCenter,
              child: ScaleTransition(
                scale: _animationController,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 229, 244, 237),
                      borderRadius: BorderRadius.circular(60)),
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100,
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                // payment success and bill
                const Text(
                  "Payment Success",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "💲35.00",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueAccent),
                ),

                const SizedBox(
                  height: 10,
                ),
                // course details
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 241, 245, 246),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // id details
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99),
                                color: Colors.amber),
                            child: Image.asset(
                              "assets/woman_simple_puff.png",
                              width: 40,
                            ),
                          ),

                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Christiana Amandla",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        "Adobe xd Course",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PayDetails(
                            header: "ID Transcription",
                            subheader: "2A11231PW",
                          ),
                          PayDetails(
                            header: "Invoice Date",
                            subheader: "10 Nov 2023",
                          )
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                // bar code

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: BarcodeWidget(
                      data: "2A11231PW",
                      barcode: Barcode.code128(),
                      drawText: false,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PayDetails extends StatelessWidget {
  const PayDetails({super.key, required this.header, required this.subheader});

  final String header;
  final String subheader;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          header,
          style: const TextStyle(color: Colors.blueGrey),
        ),
        Text(
          subheader,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class PaymentDone extends StatelessWidget {
  const PaymentDone({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 205, 255, 98),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.all(1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
            ),
            child: const Text("Done"),
          ),
        ),
      ],
    );
  }
}
