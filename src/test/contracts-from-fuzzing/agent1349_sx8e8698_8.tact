struct DefaultVals {
    x: Int = 5;
    y: Bool = true;
    z: String = "default";
}

contract StructDefaultValueTest {
    s: DefaultVals;

    init() {
        self.s = DefaultVals{};
    }
}