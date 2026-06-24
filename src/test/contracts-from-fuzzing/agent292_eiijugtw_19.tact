struct IntBoolOptional {
    a: Int;
    b: Bool;
    c: Int?;
}

contract OptionalMiddle {
    data: IntBoolOptional;

    init() {
        self.data = IntBoolOptional{a:1, b:false, c:null};
    }
}