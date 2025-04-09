struct Defaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "hello";
    d: Address? = null;
}

contract DefaultVals {
    data: Defaults;

    init() {
        self.data = Defaults{}; // use defaults implicitly
    }
}
