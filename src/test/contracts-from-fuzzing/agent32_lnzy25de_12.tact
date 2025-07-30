struct Bar {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract TestContract {
    barOpt: Bar?;

    init() {
        self.barOpt = null;
    }
}