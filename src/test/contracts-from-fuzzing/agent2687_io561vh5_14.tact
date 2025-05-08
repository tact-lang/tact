struct OptInner {
    foo: Int?;
}

struct OptMid {
    bar: OptInner?;
}

contract OptionalMidStruct {
    data: OptMid;

    init() {
        self.data = OptMid{ bar: null };
    }
}