struct Params {
    val1: Int;
    val2: Int?;
    val3: String;
    flag: Bool;
    bigNum: Int as uint128;
    payload: Cell;
    anotherFlag: Bool?;
}

contract MultiType {
    paramz: Params;
    init() {
        self.paramz = Params{
            val1: 1,
            val2: null,
            val3: "hi",
            flag: true,
            bigNum: 123,
            payload: emptyCell(),
            anotherFlag: false
        };
    }
}
