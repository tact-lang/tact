struct StructWithString {
    s: String;
}

contract OptionalStringStruct {
    opt: StructWithString?;
    init() {
        self.opt = StructWithString{s: "ABC"};
    }
}