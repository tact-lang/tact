struct WithDefaults {
    n: Int = 7;
    s: String = "x";
    b: Bool = false;
    opt: Int?;
}

contract DefaultsStorage {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            opt: null,
        };
    }
}