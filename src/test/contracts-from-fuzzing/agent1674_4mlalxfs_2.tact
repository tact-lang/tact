struct Inner {
    flag: Bool;
    count: Int;
}

struct Middle {
    num: Int;
    inr: Inner;
}

contract DeepNested {
    value: Middle;

    init() {
        self.value = Middle{ num: 3, inr: Inner{ flag: true, count: 5 } };
    }
}