struct HasBoolOpt {
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;
    f4: Bool?;
    f5: Bool?;
    f6: Bool?;
}

contract ManyOptionTest {
    state: HasBoolOpt;

    init() {
        self.state = HasBoolOpt{
            f1: null,
            f2: true,
            f3: false,
            f4: null,
            f5: true,
            f6: false,
        };
    }
}