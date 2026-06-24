struct NestedMany {
    a: Int;
    s: SubNested;
}

struct SubNested {
    x: Int;
    y: Int;
    z: Int;
}

contract TestContract {
    state: NestedMany;

    init() {
        self.state = NestedMany{
            a: 100,
            s: SubNested{
                x: 1,
                y: 2,
                z: 3,
            }
        };
    }
}
