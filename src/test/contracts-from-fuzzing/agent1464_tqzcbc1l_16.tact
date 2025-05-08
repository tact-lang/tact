struct DefaultOpt {
    a: Int?; // implicit null
    b: Int = 2;
    c: Bool = true;
}

contract TestContract {
    data: DefaultOpt;

    init() {
        self.data = DefaultOpt{};
    }
}