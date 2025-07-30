struct L1 {
    a:Int;
}

struct L2 {
    sub:L1;
}

struct L3 {
    sub:L2;
}

struct L4 {
    sub:L3;
}

struct L5 {
    sub:L4;
}

struct L6 {
    sub:L5;
}

struct L7 {
    sub:L6;
}

struct L8 {
    sub:L7;
}

contract Deep8 {
    data: L8;
    init() {
        self.data = L8{
            sub: L7{
                sub: L6{
                    sub: L5{
                        sub: L4{
                            sub: L3{
                                sub: L2{
                                    sub: L1{a:42}
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}