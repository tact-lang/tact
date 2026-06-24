struct OptionalInner {
    f: Int?;
}

struct OptionalOuter {
    g: OptionalInner?;
    name: String;
}

contract NestedOptionalStructs {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{
            g: null,
            name: "testing"
        };
    }
}