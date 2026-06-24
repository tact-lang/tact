struct Nested {
    i: Int;
    b: Bool;
    s: String;
}

contract FieldsDefault {
    f: Nested = Nested{ i:1, b:true, s:"x" };

    init() {
        self.f = Nested{ i:2, b:false, s:"y" };
    }
}