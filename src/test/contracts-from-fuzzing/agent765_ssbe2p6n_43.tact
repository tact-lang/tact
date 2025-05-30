struct SDeep {
    inner: SInner;
}

struct SInner {
    innermost: SInnerMost;
}

struct SInnerMost {
    x: Int;
    y: Bool;
    z: String;
}

contract NestedParamStruct2(
  arg: SDeep
) {
}