struct OptionalNested {
    val: Int?;
    nested: Inner?;
}

struct Inner {
    innerVal: Bool?;
    deepVal: Deeper?;
}

struct Deeper {
    name: String?;
}

contract OptTest {
    state: OptionalNested;

    init() {
        self.state = OptionalNested{
            val: null,
            nested: null,
        };
    }
}
