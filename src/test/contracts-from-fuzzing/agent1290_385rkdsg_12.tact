struct Param1 {
    flag: Bool;
    num: Int as int32;
}

struct Param2 {
    txt: String;
    optionalNum: Int?;
}

contract TestContract {
    p1: Param1;
    p2: Param2;

    init() {
        self.p1 = Param1{ flag: true, num: -12345 };
        self.p2 = Param2{ txt: "abc", optionalNum: null };
    }

    receive() {
        self.p1 = Param1{ flag: false, num: 54321 };
        self.p2 = Param2{ txt: "xyz", optionalNum: 99 };
    }
}