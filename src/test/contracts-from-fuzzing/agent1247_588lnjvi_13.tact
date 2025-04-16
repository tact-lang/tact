struct Base {
    bigNum: Int as int257;
    smallNum: Int as int4;
    flag: Bool;
    optText: String?;
    someBytes: Cell;
}

contract MixedPersistence {
    myData: Base;

    init() {
        self.myData = Base{
            bigNum: 12345678901234567890,
            smallNum: 6,
            flag: true,
            optText: null,
            someBytes: emptyCell()
        };
    }
}