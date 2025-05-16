struct Breaker {
    x: Int;
}

struct Wrapper1 {
    b: Breaker;
}
struct Wrapper2 {
    b: Breaker;
}

contract MultiRefToStruct {
    w1: Wrapper1;
    w2: Wrapper2;

    init() {
        self.w1 = Wrapper1{b: Breaker{x:5}};
        self.w2 = Wrapper2{b: Breaker{x:6}};
    }
}