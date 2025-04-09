struct HasDefault {
    a: Int = 5;
    b: Int?;
}

contract TestSD {
    f: HasDefault;

    init() {
        self.f = HasDefault{};
    }
}