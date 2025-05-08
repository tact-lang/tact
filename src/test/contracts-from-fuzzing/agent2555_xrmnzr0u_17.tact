struct PowStruct {
    bigVal: Int = pow(2, 10);
}

contract ConstExprTest {
    ps: PowStruct;

    init() {
        self.ps = PowStruct{};
    }
}