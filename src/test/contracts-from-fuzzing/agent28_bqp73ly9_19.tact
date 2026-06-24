struct Sub {
    flag: Bool;
}

contract ArrayLike {
    s1: Sub;
    s2: Sub;
    s3: Sub;
    s4: Sub;
    s5: Sub;

    init() {
        self.s1 = Sub{ flag:true };
        self.s2 = Sub{ flag:false };
        self.s3 = Sub{ flag:true };
        self.s4 = Sub{ flag:false };
        self.s5 = Sub{ flag:true };
    }
}