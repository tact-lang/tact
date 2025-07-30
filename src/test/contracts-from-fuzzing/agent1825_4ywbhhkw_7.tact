struct Child {
    a: Int;
    b: Bool;
    c: String;
}

struct Parent {
    x: Int;
    y: Bool;
    z: Child;
}

contract MixedTypes {
    store: Parent;

    init() {
        self.store = Parent{
            x: 77,
            y: false,
            z: Child{a:42, b:true, c:"hi"}
        };
    }
}
