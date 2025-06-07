struct Opts {
    i: Int?;
    b: Bool?;
}

contract ComboNulls {
    g: Opts?;

    init() {
        self.g = null;
    }
}
