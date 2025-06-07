struct NestedOpt {
    innerVal: Int? = null;
}

struct MiddleOpt {
    val: Int = 5;
    nested: NestedOpt? = null;
}

contract OptionalInOptional {
    o: MiddleOpt = MiddleOpt{
        val: 42,
        nested: null
    };

    init() {
        self.o = MiddleOpt{
            val: 50,
            nested: NestedOpt{ innerVal: null }
        };
    }

    receive() {}
}