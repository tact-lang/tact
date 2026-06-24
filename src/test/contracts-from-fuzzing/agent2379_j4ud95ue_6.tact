struct Sub {
    a: Int;
    b: String?;
    c: Bool;
}

contract Test {
    s1: Sub;
    s2: Sub;

    init() {
        self.s1 = Sub{ a:1, b:null, c:true };
        self.s2 = Sub{ a:2, b:"yes", c:false };
    }
}