struct Weird {
    a: Int? = 0;
    b: Bool? = true;
    s: String? = "str";
    n: Int = 1;
    f: Bool = false;
}

contract WeirdComboInit {
    rec: Weird;
    init() {
        self.rec = Weird{};
    }
}