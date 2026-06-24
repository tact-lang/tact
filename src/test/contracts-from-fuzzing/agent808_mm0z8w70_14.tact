struct StrStruct {
    s: String;
}

contract StringStructField {
    val: StrStruct;

    init() {
        self.val = StrStruct{ s: "hi" };
    }
}