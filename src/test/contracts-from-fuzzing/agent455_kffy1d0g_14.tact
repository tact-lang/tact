struct OneOption {
    val: Int?;
}

struct TwoOption {
    v1: OneOption?;
    v2: OneOption?;
}

contract NestedOptionalFields {
    state: TwoOption;

    init() {
        self.state = TwoOption{
            v1: null,
            v2: null,
        };
    }
}