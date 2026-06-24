struct OptionalNest2 {
    a: Int?;
    b: String?;
}

struct OptionalOuter {
    i: OptionalNest2?;
    j: Cell?;
}

contract NestedOptionalsFlat {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{
            i: null,
            j: null,
        };
    }
}
