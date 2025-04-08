struct WithPartialDefaults {
    a: Int;
    b: Bool = false;
}

contract PartialDefaults {
    data: WithPartialDefaults;

    init() {
        self.data = WithPartialDefaults{
            a: 42
        };
    }
}