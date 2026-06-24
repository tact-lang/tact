struct StructA {
    x: Int?;
}

struct StructB {
    y: Bool?;
}

struct Nesting {
    sa: StructA?;
    sb: StructB?;
    label: String;
    value: Int?;
}

contract TestOptsEverywhere {
    state: Nesting?;

    init() {
        self.state = Nesting{
            sa: null,
            sb: null,
            label: "xx",
            value: null,
        };
    }
}
