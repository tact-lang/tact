struct MidLevel {
    flag: Bool;
    txt: String;
}

struct TopLevel {
    intVal: Int;
    innerOne: MidLevel;
    innerTwo: MidLevel;
    optTxt: String?;
}

contract MultipleNestedFields {
    state: TopLevel;

    init() {
        self.state = TopLevel{
            intVal: 42,
            innerOne: MidLevel{
                flag: true,
                txt: "hello",
            },
            innerTwo: MidLevel{
                flag: false,
                txt: "world",
            },
            optTxt: null,
        };
    }
}