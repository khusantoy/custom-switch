import 'package:flutter/material.dart';

class CarouselCard extends StatefulWidget {
  const CarouselCard({super.key});

  @override
  State<CarouselCard> createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard> {
  PageController pageController = PageController();

  int currentPage = 0;
  bool isForward = true;
  final int totalPages = 4;

  @override
  void initState() {
    super.initState();
    increment();
  }

  void increment() {
    Future.delayed(const Duration(seconds: 2), () {
      if (pageController.hasClients) {
        if (isForward) {
          currentPage++;
          if (currentPage >= totalPages) {
            currentPage = totalPages - 1;
            isForward = false;
          }
        } else {
          currentPage--;
          if (currentPage < 0) {
            currentPage = 0;
            isForward = true;
          }
        }
        pageController
            .animateToPage(
              currentPage,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            )
            .then((_) => increment());
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Carousel"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                currentPage = value;
              },
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      "https://global-uploads.webflow.com/62fca6954348cf321d918ef1/63ecdb90ab68901626f1673a_toomas-tartes-Yizrl9N_eDA-unsplash.jpg",
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      "https://actiongroup.az/wp-content/uploads/hiking-tours.jpg",
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      "https://goreg.com/wp-content/uploads/2014/03/blog-8.jpg",
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      "https://i.pinimg.com/originals/12/34/4c/12344cd6cdc11f639a205b4d455b7143.jpg",
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
