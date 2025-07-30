struct DeeplyNested {
    i: Int;
}

struct Middle {
    d: DeeplyNested;
}

struct Top {
    m: Middle;
}

contract StorageDeep {
    val: Top = Top{m: Middle{d: DeeplyNested{i: 1}}};
}