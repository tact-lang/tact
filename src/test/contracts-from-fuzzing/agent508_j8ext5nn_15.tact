struct RecDefault {
    int1: Int = 1;
    flag1: Bool = false;
    str1: String = "abc";
    addr1: Address? = null;
}

contract ContractTest {
    rec: RecDefault;
    init() {
        self.rec = RecDefault{};
    }
}