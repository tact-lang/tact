struct SubOne { v1: Int; }
struct SubTwo { v2: String; }
struct SubThree { v3: Bool; }

struct ComposeAll {
    s1: SubOne;
    s2: SubTwo;
    s3: SubThree;
    text: String;
    number: Int as uint64;
    flag: Bool;
    optSub: SubOne?;
    optBool: Bool?;
}

contract ComplexStorage {
    composite: ComposeAll;

    init() {
        self.composite = ComposeAll{
            s1: SubOne{v1:1},
            s2: SubTwo{v2:"hi"},
            s3: SubThree{v3:true},
            text: "hello",
            number: 55,
            flag: false,
            optSub: null,
            optBool: true
        };
    }
}