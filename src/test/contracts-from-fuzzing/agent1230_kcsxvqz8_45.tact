struct DefaultOpt {
    x: Int? = null;
}

contract AssignedOpt {
    f: DefaultOpt;

    init() {
        self.f = DefaultOpt{ x: 123 };
    }
}