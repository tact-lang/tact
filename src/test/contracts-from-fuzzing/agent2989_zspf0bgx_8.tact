struct Defaulted {
    x: Int = 13;
    y: String = "Lucky";
    z: Bool = false;
}

contract DefaultStructHolder {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}
