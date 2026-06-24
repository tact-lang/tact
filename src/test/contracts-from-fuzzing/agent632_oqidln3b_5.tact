struct DefaultOpt {
    name: String = "default";
    active: Bool = true;
    value: Int?; // default null
}

contract TestContract {
    data: DefaultOpt;

    init() {
        self.data = DefaultOpt{ };
    }
}