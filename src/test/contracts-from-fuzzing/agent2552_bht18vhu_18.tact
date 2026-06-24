struct StringContainer {
    txt: String = "Looooooooooooooooooooooooooooooooooooooooooooooooong";
}

contract OptNestedLargeString {
    stuff: StringContainer?;
}