struct WithOptional {
    number: Int?;
    flag: Bool;
}

contract TestContract {
    data: WithOptional;

    init() {
        self.data = WithOptional{ number: null, flag: true };
    }
}