struct Child { val: Int; }

contract OptionalStructs {
    a: Child?;
    b: Child?;

    init() {
        self.a = null;
        self.b = Child{ val: 5 };
    }
}