struct Sub {
    k: Int;
    v: String;
}

struct NestedOpt {
    f1: Bool;
    f2: Sub?; // optional nested struct
    f3: String;
}

contract HasOptionalNested {
    data: NestedOpt = NestedOpt{ f1: true, f2: null, f3: "Hello" };
}