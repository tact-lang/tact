struct BoolInt {
    flag: Bool;
    num: Int;
}

contract DefaultValueStruct {
    f: BoolInt;

    init() {
        self.f = BoolInt{flag:true,num:42};
    }
}