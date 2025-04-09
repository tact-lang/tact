struct ComplexStruct {
    a: Int = 0;
    b: Bool = false;
    c: String = "x";
    d: Int?;
    e: Bool?;
    f: String? = null;
    g: Int? = null;
    h: Bool = true;
    i: String = "";
    j: Int;
    k: Bool? = false;
    l: Int? = 42;
}

contract TestContract {
    myField: ComplexStruct;

    init() {
        self.myField = ComplexStruct{
            a: 99,
            b: true,
            c: "str",
            d: null,
            e: null,
            f: null,
            g: null,
            h: false,
            i: "end",
            j: 7,
            k: true,
            l: 84
        };
    }
}