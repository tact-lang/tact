struct Simple {
    val: Int;
}

struct Wrapper1 {
    s: Simple;
}

struct Wrapper2 {
    w: Wrapper1;
}

struct Wrapper3 {
    ww: Wrapper2;
}

struct Wrapper4 {
    www: Wrapper3;
}

contract Nest4 {
    val: Wrapper4;

    init() {
        self.val = Wrapper4{
            www: Wrapper3{
                ww: Wrapper2{
                    w: Wrapper1{
                        s: Simple{ val: 9 },
                    }
                }
            }
        };
    }
}