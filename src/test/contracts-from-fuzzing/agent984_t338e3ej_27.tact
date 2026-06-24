struct InnerVals {
    x: Int;
    y: String;
}

struct Compound {
    a: InnerVals;
    b: InnerVals;
    c: InnerVals;
}

contract CompoundNested {
    val: Compound = Compound{
        a: InnerVals{x: 1, y: "a"},
        b: InnerVals{x: 2, y: "b"},
        c: InnerVals{x: 3, y: "c"}
    };
}