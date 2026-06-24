struct Wrap {
    inn: Int;
    optInt: Int?;
}

contract C {
    field1: Wrap;
    field2: Int;
    flag: Bool;

    init() {
        self.field1 = Wrap{inn: 4, optInt: null};
        self.field2 = 5;
        self.flag = true;
    }
}