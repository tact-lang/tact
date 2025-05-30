struct OptionalDeep {
    inner1: Int?;
    inner2: String?;
    inner3: Bool?;
}

struct Wrapper {
    nested: OptionalDeep;
    count: Int = 10;
}

contract TestContract {
    state: Wrapper = Wrapper{
        nested: OptionalDeep{},
        count: 10
    };

    init() {
        self.state = Wrapper{
            nested: OptionalDeep{},
            count: 10
        };
    }
}