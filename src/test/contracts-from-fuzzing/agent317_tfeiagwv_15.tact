struct Inner {
    val: Int;
}

struct Outer {
    o: Inner;
}

contract DefaultNested {
    data: Outer;

    init() {
        self.data = Outer{
            o: Inner{val: 777}
        };
    }
}