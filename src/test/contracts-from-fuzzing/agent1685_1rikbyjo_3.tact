struct Inner {
    val: Int?;
    flag: Bool?;
}

struct Outer {
    nested: Inner?;
    address: Address?;
    message: String?;
}

contract OptionalsDeep {
    state: Outer;

    init() {
        self.state = Outer{
            nested: null,
            address: null,
            message: null,
        };
    }
}
