// Deep optional nesting, this time inside struct optional field prohibited? Should be valid if not nested optional
struct InnerOpt {
    val: Int;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OuterOptCont {
    o: OuterOpt;

    init() {
        self.o = OuterOpt{ inner: null };
    }
}