struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Bool;
}

contract TupleLike {
    fst: Inner1;
    snd: Inner2;

    init() {
        self.fst = Inner1{x:1};
        self.snd = Inner2{y:true};
    }
}