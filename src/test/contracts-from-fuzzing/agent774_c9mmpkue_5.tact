struct ComplexInner {
    i: Int;
    flag: Bool;
    txt: String;
}

contract ComplexDefaults {
    inner: ComplexInner = ComplexInner{ i: 7, flag: false, txt: "default" };
}