struct InitMe {
    a: Int;
    b: String;
}

contract MustInitAll {
    num: Int?;
    flag: Bool?;
    txt: String?;
    nestedStruct: InitMe;

    init() {
        self.num = 5;
        self.flag = true;
        self.txt = "xxx";
        self.nestedStruct = InitMe{ a: 111, b: "nested" };
    }
}