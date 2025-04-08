struct NestedStrings {
    txt1: String;
    txt2: String?;
}

contract StringsNestedOpt {
    data: NestedStrings?;

    init() {
        self.data = null;
    }
}