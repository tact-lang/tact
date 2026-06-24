struct DeepNested {
    lv3: Int;
}

struct MidNested {
    lv2: DeepNested;
}

struct TopNested {
    lv1: MidNested;
}

contract DeepNestedStruct {
    val: TopNested = TopNested{ lv1: MidNested{ lv2: DeepNested{ lv3: 3 } } };
}