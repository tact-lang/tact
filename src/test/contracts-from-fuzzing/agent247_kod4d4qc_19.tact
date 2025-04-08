struct DefaultVals {
    a: Int = 0;
    b: Bool = false;
    c: String = "hi";
    d: Bool = true;
    e: Int = -1;
    f: String = "bye";
}

contract Defaults {
    data: DefaultVals;
    init() {
        self.data = DefaultVals{};
    }
}