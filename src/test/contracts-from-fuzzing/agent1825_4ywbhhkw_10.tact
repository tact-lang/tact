struct Params {
    one: Int = 1;
    two: String = "two";
    three: Bool = false;
}

contract Defaults {
    data: Params;
    init() {
        self.data = Params{};
    }
}
