struct WideOptionalStruct {
    a: Int?;
    b: Int? = 5;
    c: Bool? = null;
    d: String? = "s";
    e: Int?;
    f: Bool? = true;
    g: String?;
    h: Int? = null;
    i: Bool?;
    j: String? = "";
    k: Int? = 42;
    l: Bool? = false;
    m: String?;
    n: Int? = 1;
    o: Bool?;
}

contract TestContract {
    data: WideOptionalStruct;

    init() {
        self.data = WideOptionalStruct{
            a: 1,
            b: 2,
            c: false,
            d: "str",
            e: null,
            f: true,
            g: "abc",
            h: null,
            i: null,
            j: "",
            k: 555,
            l: true,
            m: "x",
            n: 7,
            o: false
        };
    }
}