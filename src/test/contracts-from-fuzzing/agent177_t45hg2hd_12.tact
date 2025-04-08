struct SubStruct {
    flag: Bool = true;
    text: String = "sub";
}

struct TopStruct {
    num: Int = 0;
    sub: SubStruct;
    optStr: String?;
    optBool: Bool?;
}

contract MixedNestedStructs {
    data: TopStruct;

    init() {
        self.data = TopStruct{
            num: 99,
            sub: SubStruct{ flag: false, text: "changed" },
            optStr: "hi",
            optBool: true
        };
    }
    receive(){}
}