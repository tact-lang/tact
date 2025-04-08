struct Leaf {
    a: Int as uint32;
    b: Bool?;
    c: String;
}

struct Branch {
    left: Leaf?;
    right: Leaf;
    tag: Bool;
}

struct Root {
    main: Branch;
    spare: Branch?;
    version: Int as uint8;
}

contract ComplexNested {
    state: Root;

    init() {
        self.state = Root{
            main: Branch{
                left: null,
                right: Leaf{ a: 42, b: true, c: "leaf" },
                tag: true
            },
            spare: Branch{
                left: Leaf{ a: 0, b: null, c: "" },
                right: Leaf{ a: 1, b: false, c: "b" },
                tag: false
            },
            version: 7
        };
    }
}
