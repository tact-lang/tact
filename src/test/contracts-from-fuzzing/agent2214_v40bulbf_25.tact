struct Tall {
    a: Int;
    b: Bool;
    c: String;
}

contract LongFields {
    val1: Tall;
    val2: Tall;
    val3: Tall;
    val4: Tall;

    init() {
        self.val1 = Tall{a:1,b:true,c:"a"};
        self.val2 = Tall{a:2,b:false,c:"b"};
        self.val3 = Tall{a:3,b:true,c:"c"};
        self.val4 = Tall{a:4,b:false,c:"d"};
    }
}