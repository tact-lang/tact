struct SubStruct {
    flag: Bool;
    s: String;
}

struct OuterStruct {
    n: Int;
    sub: SubStruct;
    optInt: Int?;
    optStr: String?;
}

contract TestContract {
    s: OuterStruct;

    init() {
        self.s = OuterStruct{
            n: 1,
            sub: SubStruct{
                flag: true,
                s: "hello"
            },
            optInt: null,
            optStr: null
        };
    }
}