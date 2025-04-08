struct Child1 {
    x: Int;
    y: Bool;
}

struct Child2 {
    z: String;
    w: Address;
}

struct Parent {
    first: Child1;
    second: Child2;
}

contract TestContract {
    parent: Parent;

    init() {
        self.parent = Parent{
            first: Child1{ x: 10, y: true },
            second: Child2{ z: "abc", w: myAddress() }
        };
    }
}