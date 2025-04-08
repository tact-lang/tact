struct DefaultOption {
    x: Int?; 
    y: Bool?; 
}

contract OnlyDefaults {
    opt: DefaultOption;

    init() {
        self.opt = DefaultOption{};
    }
}