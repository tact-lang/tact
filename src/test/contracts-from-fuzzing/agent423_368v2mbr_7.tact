struct DeeplyNested {
    in1: Inner;
}

struct Inner {
    nested: InnerMost;
}

struct InnerMost {
    val: Int;
    flag: Bool;
}

contract DeeplyNestedStruct {
    data: DeeplyNested = DeeplyNested{ in1: Inner{ nested: InnerMost{ val: 10, flag: true } } };
}