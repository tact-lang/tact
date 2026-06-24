struct DeepRec {
    val: Int;
}

struct MidRec {
    deep: DeepRec;
}

contract NestedRecDefault {
    m: MidRec = MidRec{ deep: DeepRec{ val: 42 } };
}
