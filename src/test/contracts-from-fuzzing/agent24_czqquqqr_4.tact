struct Inner {
    m: map<Int, Cell>;
    o: Int?;
}

struct Outer {
    arr: map<Int, Inner>;
    flag: Bool;
}

contract TestComplexNested {
    s: Outer;

    init() {
        self.s = Outer{
            arr: emptyMap(),
            flag: true
        };
    }

    receive() {
        let inner = Inner{ m: emptyMap(), o: null };
        self.s.arr.set(1, inner);
        self.s.flag = false;
    }
}
