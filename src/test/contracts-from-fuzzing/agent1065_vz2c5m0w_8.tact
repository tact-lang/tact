struct Params {
    a: Int = 7;
    b: String = "hello";
}

contract StructDefaultField {
    param: Params;

    init() {
        self.param = Params{};
    }
}
