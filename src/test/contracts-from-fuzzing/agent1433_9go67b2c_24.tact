struct StrStruct {
    a: String;
    b: String?;
}

contract StringNested {
    s: StrStruct;

    init() {
        self.s = StrStruct{ a: "hi", b: null };
    }
}
