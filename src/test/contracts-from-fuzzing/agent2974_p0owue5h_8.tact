// Deep nested optionals in struct fields
struct OptionalDeep {
    a: Int?;
    b: Bool?;
}

struct OptionalOuter {
    inner1: OptionalDeep?;
    inner2: OptionalDeep?;
}

contract TestContract {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{
            inner1: null,
            inner2: OptionalDeep{ a: 1, b: null },
        };
    }
}