struct DefaultsStruct {
    alpha: Int = 1;
    beta: Bool = false;
    gamma: String = "hello";
    delta: Int as uint32 = 42;
    epsilon: Bool?;
    zeta: String?;
}

contract DefaultFields {
    state: DefaultsStruct;

    init() {
        self.state = DefaultsStruct{
            epsilon: null,
            zeta: null
        };
    }
}