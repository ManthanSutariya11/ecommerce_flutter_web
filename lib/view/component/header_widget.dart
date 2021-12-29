import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    height: 30,
                  ),
                ),
                SizedBox(
                  width: 26,
                ),
                Text(
                  'Sell on Shopka',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 17,
                ),
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 44,
                  width: size.width * 0.35,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    color: Color(0xFFEDEDF0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      suffixIcon: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            print('clear field');
                          },
                          child: const Icon(
                            Icons.close,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xFF9DC2FF),
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      color: Color(0xFF2264D1),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xFF9DC2FF),
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    'My Cart',
                    style: TextStyle(
                      color: Color(0xFF2264D1),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
