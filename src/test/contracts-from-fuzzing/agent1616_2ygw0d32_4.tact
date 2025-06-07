struct Wide {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
    d: Int = 2;
    e: Bool = true;
    f: String = "foo";
    g: Int = 3;
    h: Bool = false;
    i: String = "bar";
    j: Int = 4;
}

contract WideStorage {
    val: Wide = Wide{};

    init() {
        self.val = Wide{a: 10, b: true, c: "test", d: 20, e: false, f: "ok", g: 30, h: true, i: "wow", j: 40};
    }
}