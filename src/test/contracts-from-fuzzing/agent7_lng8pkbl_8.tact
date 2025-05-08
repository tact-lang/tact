struct OptionalBools {
    ob1: Bool?;
    ob2: Bool?;
    ob3: Bool?;
}

contract OptBoolContract {
    obs: OptionalBools;

    init() {
        self.obs = OptionalBools{
            ob1: null,
            ob2: true,
            ob3: false
        };
    }
}