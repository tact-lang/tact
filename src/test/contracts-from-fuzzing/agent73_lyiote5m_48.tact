struct MultiStruct {
    a: Int;
    b: Bool;
}

contract Test {
    s1: MultiStruct;
    s2: MultiStruct;

    init() {
        self.s1 = MultiStruct{ a:1, b:true };
        self.s2 = MultiStruct{ a:2, b:false };
    }
}