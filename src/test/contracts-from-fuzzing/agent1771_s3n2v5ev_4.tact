struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    innerField: Inner?;
}

struct Outer {
    mid: Middle?;
}

contract NestedOptionalStructs {
    myField: Outer;

    init() {
        self.myField = Outer{ mid: Middle{ innerField: Inner{ a: 1, b: true } } };
    }
}