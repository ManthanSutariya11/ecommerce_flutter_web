import 'package:flutter/material.dart';

class CategorySideBarRow extends StatefulWidget {
  final String? caption;
  final String title;
  final List<String?>? subCategory;
  final VoidCallback onTap;
  final bool isSelected;
  final int index;
  final int selectedIndex;
  final String selectedSubcategory;
  final Function subCategoryOntap;

  const CategorySideBarRow({
    Key? key,
    required this.title,
    required this.subCategory,
    required this.caption,
    required this.onTap,
    required this.isSelected,
    required this.index,
    required this.selectedIndex,
    required this.selectedSubcategory,
    required this.subCategoryOntap,
  }) : super(key: key);

  @override
  State<CategorySideBarRow> createState() => _CategorySideBarRowState();
}

class _CategorySideBarRowState extends State<CategorySideBarRow> {
  bool isShowMore = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: SizedBox.fromSize(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!widget.isSelected)
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                      ),
                    if (widget.index == widget.selectedIndex)
                      const Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        size: 17,
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xFF19191D),
                            fontWeight: widget.isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        if (widget.caption != null && widget.caption != "")
                          Text(
                            widget.caption ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFF787885),
                              fontSize: 14,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                if (widget.subCategory!.isNotEmpty && widget.isSelected)
                  SizedBox.fromSize(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        !isShowMore ? 5 : widget.subCategory!.length,
                        (index) => GestureDetector(
                          onTap: () {
                            widget.subCategoryOntap(
                                widget.subCategory![index] ?? "");
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              left: 40,
                            ),
                            child: Text(
                              widget.subCategory![index] ?? "",
                              style: TextStyle(
                                fontWeight: widget.selectedSubcategory ==
                                        widget.subCategory![index]
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (widget.subCategory!.isNotEmpty &&
                    widget.isSelected &&
                    !isShowMore)
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: SizedBox(
                      height: 28,
                      width: 114,
                      child: TextButton(
                        onPressed: () {
                          isShowMore = true;
                          setState(() {});
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) => (const Color(0xFFEBF2FF)),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Show more',
                            style: TextStyle(
                              color: Color(0xFF2264D1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
