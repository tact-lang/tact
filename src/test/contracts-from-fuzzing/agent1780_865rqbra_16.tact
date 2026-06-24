struct ConstStruct {
    constA: Int = 1;
    constB: Bool = true;
    constS: String = "constant";
}

contract ConstStructTest {
    data: ConstStruct;

    init() {
        self.data = ConstStruct{}; // rely on all defaults
    }
}