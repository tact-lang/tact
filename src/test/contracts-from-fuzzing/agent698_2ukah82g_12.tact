struct Defaulted {
    x: Int = 10;
    y: Bool = false;
    z: Int?;
}

contract TestContract {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}