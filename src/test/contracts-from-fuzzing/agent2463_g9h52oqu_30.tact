struct ManyDefaults {
    a: Int = 0;
    b: String = "";
    c: Bool = false;
    d: Int? = null;
    e: String? = null;
    f: Bool? = null;
}

contract UseManyDefaults {
    data: ManyDefaults = ManyDefaults{
        a:0, b:"", c:false, d:null, e:null, f:null
    };

    init() {}
}
