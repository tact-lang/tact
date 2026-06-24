struct DataSub {
    info: String?;
    flag: Bool?;
    count: Int;
}

struct DataMain {
    num: Int;
    sub1: DataSub?;
    sub2: DataSub?;
}

contract MultiOptTest {
    stored: DataMain;

    init() {
        self.stored = DataMain{
            num: 99,
            sub1: DataSub{ info: "hi", flag: null, count: 1 },
            sub2: null
        };
    }
}