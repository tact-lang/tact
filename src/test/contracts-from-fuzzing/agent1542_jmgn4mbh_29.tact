struct Deep {
    i8: Int as int8;
    u8: Int as uint8;
    flag: Bool;
    opt: Int?;
    txt: String?;
}

struct Bag {
    a: Int;
    b: Bool?;
    c: String;
    d: Deep;
    e: Deep?;
}

contract Test {
    storage: Bag;

    init() {
        self.storage = Bag{
            a: 5,
            b: null,
            c: "hi",
            d: Deep{ i8:-1, u8:255, flag:true, opt:null, txt:null },
            e: null
        };
    }
}