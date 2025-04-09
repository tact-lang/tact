struct Inner {
    val: Int;
}

struct Outer {
    val: Int;
    inr: Inner;
}

contract TestContract {
    o: Outer;
    x: Int;

    init() {
        self.o = Outer{
            val: 5,
            inr: Inner{ val: 10 }
        };
        self.x = 42;
    }
}