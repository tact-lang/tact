struct NestedTwoOptionalStructs {
    s1: String?;
    s2: Int?;
}

struct Container {
    inner: NestedTwoOptionalStructs?;
}

contract NestedOptStructs {
    data: Container;

    init() {
        self.data = Container{ inner: null };
    }
}