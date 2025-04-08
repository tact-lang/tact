struct WithOptional {
    val: Int?;
    flag: Bool;
}

contract TestContract {
    data: WithOptional = WithOptional{ val: null, flag: true };

    init() {
        self.data = WithOptional{ val: 42, flag: false };
    }
}