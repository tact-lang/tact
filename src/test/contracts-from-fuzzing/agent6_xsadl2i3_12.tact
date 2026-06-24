struct SOpt {
    z: Int?;
}

struct SNil {
    x: Int;
    y: SOpt?;
}

contract NestedNullable {
    d: SNil;
    init() {
        self.d = SNil{
            x: 1,
            y: null,
        };
    }
}