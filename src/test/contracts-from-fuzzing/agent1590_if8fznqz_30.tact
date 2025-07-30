struct Sub {
    a: Int;
    b: Int;
    flag: Bool;
}

contract SubFields {
    one: Sub;
    two: Sub;

    init() {
        self.one = Sub{ a:1, b:2, flag:false };
        self.two = Sub{ a:3, b:4, flag:true };
    }
}