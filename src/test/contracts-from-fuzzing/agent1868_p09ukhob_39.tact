struct MultLayer {
    a: Int;
    b: StructInner;
}

struct StructInner {
    flag: Bool;
    text: String;
}

contract NestedMix {
    m: MultLayer = MultLayer{
        a: 1,
        b: StructInner{
            flag: false,
            text: "hey"
        }
    };

    init() {}
}