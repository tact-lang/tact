struct SubStruct {
    i: Int;
    s: String;
}

contract OptionalStructField {
    sub: SubStruct?;

    init() {
        self.sub = SubStruct{ i:123, s:"hi" };
    }
}