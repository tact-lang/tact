struct Inner {
    x: Int?;
    y: String?;
}

struct Outer {
    inn: Inner?;
    z: Bool;
}

contract NestedOptionalStructs {
    state: Outer;

    init() {
        self.state = Outer{
            inn: Inner{ x: 10, y: null },
            z: true
        };
    }
}