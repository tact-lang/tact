struct DefaultVals {
    a: Int = 1;
    b: Bool = true;
    c: String = "hai";
}

contract DefaultsDemo {
    rec: DefaultVals;

    init() {
        self.rec = DefaultVals{};
    }
}