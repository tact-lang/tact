struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "ok";
}

contract StructDefaultFields {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}
