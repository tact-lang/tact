struct LongList {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Int;
    f6: Bool;
    f7: Int?;
    f8: Bool?;
    f9: Int;
    f10: Bool;
}

contract TestContract {
    data: LongList;
    
    init() {
        self.data = LongList {
            f1: 1,
            f2: true,
            f3: null,
            f4: null,
            f5: 2,
            f6: false,
            f7: null,
            f8: null,
            f9: 3,
            f10: true
        };
    }
}