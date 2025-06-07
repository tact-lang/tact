struct FieldsA {
    a: Int;
    b: Bool;
}

struct FieldsB {
    c: String;
    d: Address;
}

struct Combo {
    one: FieldsA;
    two: FieldsB;
}

contract CompositeOfComposites {
    val: Combo;

    init() {
        self.val = Combo{
            one: FieldsA{ a: 5, b: true },
            two: FieldsB{ c: "hello", d: myAddress() }
        };
    }
}