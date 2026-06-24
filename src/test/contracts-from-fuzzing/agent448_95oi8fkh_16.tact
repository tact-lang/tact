struct BoolDefault {
    a: Bool = false;
    b: Bool = true;
}

contract BoolDefaultContract {
    data: BoolDefault;

    init() {
        self.data = BoolDefault{};
    }

    receive() {}
}