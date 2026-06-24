struct A {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
}

struct B {
    x: A;
    y: A?;
    z: Bool;
}

contract NestedOptionals {
    store: B;
    init() {
        self.store = B{
            x: A{ f1: 1, f2: true, f3: "x", f4: null, f5: false, f6: null },
            y: null,
            z: false,
        };
    }
}