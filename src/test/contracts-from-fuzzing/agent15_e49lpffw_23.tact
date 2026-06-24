// deeply nested optional fields in nested structs
struct SubSub {
    f: Int?;
    g: Bool?;
}

struct Sub {
    subsub: SubSub;
    h: Int?;
}

struct Root {
    sub: Sub;
    flag: Bool;
}

contract DeepNullable {
    data: Root;

    init() {
        self.data = Root{
            sub: Sub{
                subsub: SubSub{ f: null, g: null },
                h: null
            },
            flag: true
        };
    }
}