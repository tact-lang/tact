struct Inner1 {
    value: Int;
}

struct Inner2 {
    value: Bool;
}

struct Wrap1 {
    inner: Inner1;
}

struct Wrap2 {
    inner: Inner2;
}

contract MultiNested {
    w1: Wrap1;
    w2: Wrap2;

    init() {
        self.w1 = Wrap1{inner: Inner1{value:100}};
        self.w2 = Wrap2{inner: Inner2{value:true}};
    }
}