struct SubS {
    subVal: Int;
}

contract WideFields {
    a: Int = 0;
    b: Bool = false;
    c: String = "x";
    g: Int? = null;
    h: Bool? = null;
    i: SubS = SubS{subVal: 0};
    j: SubS? = null;
}