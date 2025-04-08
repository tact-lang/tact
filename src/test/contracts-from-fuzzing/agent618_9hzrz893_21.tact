struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Int;
}

struct Comb {
    a: Inner1;
    b: Inner2;
}

contract CombineStructs {
    s: Comb;

    init() {
        self.s = Comb{a: Inner1{x:1}, b: Inner2{y:2}};
    }
}