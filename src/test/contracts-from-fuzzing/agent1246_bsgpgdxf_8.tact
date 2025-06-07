struct Inline {
    a: Int;
    b: Bool;
}

contract MultiFields {
    data1: Inline;
    data2: Inline;
    data3: Inline;
    data4: Inline;

    init() {
        self.data1 = Inline{a:1,b:true};
        self.data2 = Inline{a:2,b:false};
        self.data3 = Inline{a:3,b:true};
        self.data4 = Inline{a:4,b:false};
    }
}