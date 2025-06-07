struct NestedOpt {
    optStruct: TinyStruct?;
    val: Int;
}

struct TinyStruct {
    v: Int;
}

contract OptionalNested {
    data: NestedOpt;
    init() {
        self.data = NestedOpt{
            optStruct: TinyStruct{ v: 7 },
            val: 3,
        };
    }
}
