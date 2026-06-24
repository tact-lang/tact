struct NestedDepth {
    i: Int;
    o: OptionalNest;
}

struct OptionalNest {
    name: String?;
    flag: Bool?;
}

contract FuzzTest {
    data: NestedDepth;

    init() {
        self.data = NestedDepth{
            i: 10,
            o: OptionalNest{
                name: "test",
                flag: true
            }
        };
    }
}
