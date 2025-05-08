struct DefaultsOpt {
    i: Int?;
    j: Int = 10;
}

contract DefOpt {
    data: DefaultsOpt;

    init() {
        self.data = DefaultsOpt{
            i: null
        };
    }
}