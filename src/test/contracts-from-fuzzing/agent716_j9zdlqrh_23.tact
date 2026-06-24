struct Inner1 {
    val: Int;
}

struct Inner2 {
    inner1: Inner1;
}

struct Outer {
    inner2: Inner2;
}

contract LayerChain {
    deep: Outer;

    init() {
        self.deep = Outer{ inner2: Inner2{ inner1: Inner1{ val: 99 } } };
    }
}