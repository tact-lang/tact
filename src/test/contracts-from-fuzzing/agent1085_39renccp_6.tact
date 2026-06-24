struct HasBool {
    b1: Bool;
    b2: Bool;
    b3: Bool;
}

contract TestContract {
    flags: HasBool;
    flag2: Bool;
    number: Int;

    init() {
        self.flags = HasBool{b1:true,b2:false,b3:true};
        self.flag2 = false;
        self.number = 123;
    }
}