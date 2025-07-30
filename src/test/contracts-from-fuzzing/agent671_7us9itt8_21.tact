struct Defaults {
    x: Int as uint4 = 7;
    y: Bool = false;
    z: String = "hi";
}

contract TestContract {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}