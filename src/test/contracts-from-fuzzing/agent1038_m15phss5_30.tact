struct ComplexInner {
    intf: Int;
    boolf: Bool;
    optstr: String?;
}

contract ComplexFieldExample {
    f: ComplexInner = ComplexInner{
        intf: 100,
        boolf: true,
        optstr: null
    };
    init() {}
}