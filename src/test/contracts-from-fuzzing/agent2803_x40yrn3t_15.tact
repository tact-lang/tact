struct HoldsTwoStructs {
    first: FirstStruct;
    second: SecondStruct;
}

struct FirstStruct {
    x: Int;
    y: Bool;
}

struct SecondStruct {
    flag: Bool;
    txt: String;
}

contract MultipleNestedStructs {
    content: HoldsTwoStructs;

    init() {
        self.content = HoldsTwoStructs{
            first: FirstStruct{x:1,y:true},
            second: SecondStruct{flag:false,txt:"data"}
        };
    }
}