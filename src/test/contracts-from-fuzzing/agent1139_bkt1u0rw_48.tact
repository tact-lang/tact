struct EmptyInner {
    a: Int? = null;
}

struct OuterOpt {
    val: EmptyInner?;
}

contract DefaultNullNestedOpt {
    o: OuterOpt;
    
    init() {
        self.o = OuterOpt{ val: null };
    }
}