struct SubData {
    v: Int;
    t: String = "default";
}

struct Composite {
    sub: SubData;
    optVal: Int?;
    flag: Bool = true;
}

contract ParamMix(
    composite: Composite
) {
    receive() {}
}
