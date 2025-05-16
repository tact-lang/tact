struct SubStruct {
    id: Int;
    flag: Bool;
}

struct MainStruct {
    sub: SubStruct;
    comment: String;
    optInt: Int?;
}

contract ComplexNested {
    data: MainStruct;

    init() {
        self.data = MainStruct{
            sub: SubStruct{
                id: 1,
                flag: false
            },
            comment: "",
            optInt: null
        };
    }
}