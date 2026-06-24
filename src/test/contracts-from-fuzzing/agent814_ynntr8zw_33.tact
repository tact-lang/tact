// Contract with large nested struct with mixed optionals and defaults
struct SubStruct {
    s: String? = null;
    f: Bool;
    i: Int = 42;
}

struct MainStruct {
    a: Int;
    b: Bool?;
    c: SubStruct;
    d: SubStruct?;
}

contract LargeNestedMix {
    main: MainStruct;

    init() {
        self.main = MainStruct{
            a: 1,
            b: null,
            c: SubStruct{
                s: "hi",
                f: true,
                i: 5
            },
            d: null,
        };
    }
}