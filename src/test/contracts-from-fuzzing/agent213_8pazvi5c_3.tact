struct VeryDeep {
    innermost: Int;
}

struct Deep2 {
    inner: VeryDeep;
}

struct Deep1 {
    nested: Deep2;
}

contract TestDeepNested {
    st: Deep1 = Deep1{nested: Deep2{inner: VeryDeep{innermost: 42}}};
}