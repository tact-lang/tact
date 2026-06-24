struct DeepDefault {
    a: Int = 5;
    b: Bool = true;
    s: String = "hey";
}

contract DeepDefaultInHasInit {
    fld: DeepDefault;

    init() {
        self.fld = DeepDefault{};
    }
}
