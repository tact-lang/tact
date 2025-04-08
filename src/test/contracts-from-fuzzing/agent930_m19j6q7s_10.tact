struct Sub {
    val: Int;
}

contract ArrayLikeFields {
    f0: Sub;
    f1: Sub;
    f2: Sub;
    f3: Sub;
    f4: Sub;
    f5: Sub;
    f6: Sub;
    f7: Sub;
    f8: Sub;
    f9: Sub;

    init() {
        self.f0 = Sub{ val: 0 };
        self.f1 = Sub{ val: 1 };
        self.f2 = Sub{ val: 2 };
        self.f3 = Sub{ val: 3 };
        self.f4 = Sub{ val: 4 };
        self.f5 = Sub{ val: 5 };
        self.f6 = Sub{ val: 6 };
        self.f7 = Sub{ val: 7 };
        self.f8 = Sub{ val: 8 };
        self.f9 = Sub{ val: 9 };
    }
}