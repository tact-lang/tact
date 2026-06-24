struct InnerOptS {
    a: Int?;
}

struct OuterOptS {
    b: InnerOptS?;
}

contract DoubleOptStruct {
    s: OuterOptS;

    init() {
        self.s = OuterOptS { b: null };
    }
}