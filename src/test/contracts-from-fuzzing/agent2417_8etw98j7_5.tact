struct Inner {
    flag: Bool;
}

struct Outer {
    optionalInner: Inner?;
}

contract OptionalStructField {
    o: Outer;

    init() {
        self.o = Outer{
            optionalInner: Inner{ flag: true }
        };
    }
}
