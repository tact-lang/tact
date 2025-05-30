struct FieldOrderA {
    one: Int;
    two: Bool;
    three: String;
}

struct FieldOrderB {
    three: String;
    two: Bool;
    one: Int;
}

contract FieldOrderTest {
    a: FieldOrderA;
    b: FieldOrderB;

    init() {
        self.a = FieldOrderA{ one:1, two:true, three:"x" };
        self.b = FieldOrderB{ three:"x", two:true, one:1 };
    }
}