struct Defaults {
    a: Int = 1;
    b: Bool = true;
    s: String = "hi";
    opt: Int? = null;
}

contract StructDefaultVals {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}