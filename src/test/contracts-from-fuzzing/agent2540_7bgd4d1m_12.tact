struct Defaulted {
    x: Int = 5;
    y: String = "default";
    f: Bool = false;
}

contract DefaultsContract {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}