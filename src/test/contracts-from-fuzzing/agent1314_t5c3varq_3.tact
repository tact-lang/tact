struct OptionalNested {
    num: Int?;
    flag: Bool?;
    nested: Inner?;
}

struct Inner {
    s: String?;
    addr: Address?;
}

contract OptionalTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested {
            num: null,
            flag: null,
            nested: null,
        };
    }
}