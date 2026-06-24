struct Inner {
    A: Int;
    B: Int;
}

struct Outer {
    Inner1: Inner;
    Inner2: Inner;
}

contract TestNested {
    receive() {
        let o: Outer = Outer{
            Inner1: Inner{ A: 10, B: 20 },
            Inner2: Inner{ A: 30, B: 40 }
        };
        let dummy: Int = o.Inner1.A;
    }
}
