// contract with large persistent struct and defaulted nested optionals in it
struct NestedDefOpt {
    val: Int?;
    str: String = "default";
    flag: Bool?;
}

struct BigStruct {
    a: NestedDefOpt?;
    b: Int;
    c: Bool;
    d: String?;
    e: Int?;
}

contract BigNestedOptDefault {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: null,
            b: 1,
            c: true,
            d: null,
            e: null
        };
    }
}