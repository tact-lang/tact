struct DefaultVals {
    x: Int = 42;
    y: Bool = true;
    z: String = "hello";
}

contract Defaults {
    val: DefaultVals;

    init() {
        self.val = DefaultVals{};
    }
}
