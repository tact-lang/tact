struct DefaultVals {
    a: Int = 0;
    b: Bool = false;
    c: Int?;  // defaults implicitly to null
    d: Bool?; // defaults implicitly to null
}

contract TestContract {
    val: DefaultVals;

    init() {
        self.val = DefaultVals{};
    }
}
