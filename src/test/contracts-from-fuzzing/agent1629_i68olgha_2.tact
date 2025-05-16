struct FirstNested {
    innerInt: Int;
    optBool: Bool?;
    str: String;
}

struct SecondNested {
    flag: Bool;
    nested: FirstNested;
    strOpt: String?;
}

struct ThirdNested {
    id: Int;
    sec: SecondNested;
    desc: String?;
}

contract MultipleNestedStructs {
    data: ThirdNested;
    
    init() {
        self.data = ThirdNested{
            id: 10,
            sec: SecondNested{
                flag: true,
                nested: FirstNested{
                    innerInt: 7,
                    optBool: null,
                    str: "hi",
                },
                strOpt: null,
            },
            desc: null,
        };
    }
}
