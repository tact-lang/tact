struct DefaultsOnly {
    a: Int = 7;
    b: Bool = false;
}

contract EmptyInitStruct {
    conf: DefaultsOnly;

    init() {
        self.conf = DefaultsOnly{};
    }

    receive() {}
}