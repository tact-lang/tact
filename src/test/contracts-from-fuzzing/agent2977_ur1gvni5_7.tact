struct Defaulted {
    foo: Int = 42;
    bar: Bool = true;
}

contract DefaultStructInStorage {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}