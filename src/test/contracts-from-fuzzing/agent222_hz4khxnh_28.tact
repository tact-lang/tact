struct SS1 {
    int1: Int?;
}

struct SS2 {
    bool1: Bool?;
}

contract ManyStructOpts {
    s1: SS1 = SS1{int1: null};
    s2: SS2 = SS2{bool1: null};

    receive() {
        self.s1 = SS1{int1: 11};
        self.s2 = SS2{bool1: true};
    }
}