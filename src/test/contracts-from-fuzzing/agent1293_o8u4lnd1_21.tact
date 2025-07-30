struct AddrAndNums {
    addr1: Address;
    addr2: Address?;
    num1: Int;
    num2: Int?;
}

contract AddrOptTest {
    data: AddrAndNums;

    init() {
        self.data = AddrAndNums{
            addr1: myAddress(),
            addr2: null,
            num1: 777,
            num2: null
        };
    }
}