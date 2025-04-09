struct Params {
    a: Int = 1;
    b: Bool = false;
    s: String = "default";
}

contract TestContract {
    p: Params;

    init() {
        self.p = Params{};
    }
}