struct Struct1 {
    val: Int;
    flag: Bool;
}

struct Struct2 {
    s1: Struct1;
    text: String;
    opt: String?;
}

struct Struct3 {
    s2: Struct2;
    number: Int;
}

contract MultipleLayers {
    data: Struct3;

    init() {
        self.data = Struct3{
            s2: Struct2{
                s1: Struct1{ val:5, flag:true },
                text: "hi",
                opt: null
            },
            number: 900
        };
    }
}
