struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    i1: Inner;
    i2: Inner;
    i3: Inner;
    i4: Inner;
    i5: Inner;
}

contract NestedLargeStruct {
    o: Outer;

    init() {
        self.o = Outer{
            i1: Inner{ x: 1, y: 2 },
            i2: Inner{ x: 3, y: 4 },
            i3: Inner{ x: 5, y: 6 },
            i4: Inner{ x: 7, y: 8 },
            i5: Inner{ x: 9, y: 10 },
        };
    }
}