struct SimpleStruct {
    a: Int;
    b: Bool;
}

contract ArrayLike {
    item0: SimpleStruct;
    item1: SimpleStruct;
    item2: SimpleStruct;
    item3: SimpleStruct;

    init() {
        self.item0 = SimpleStruct{ a:0, b:true };
        self.item1 = SimpleStruct{ a:1, b:false };
        self.item2 = SimpleStruct{ a:2, b:true };
        self.item3 = SimpleStruct{ a:3, b:false };
    }
}