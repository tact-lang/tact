struct StringStruct {
    s: String;
    optS: String?;
    flag: Bool;
}

struct Holder {
    intVal: Int;
    strStruct: StringStruct;
}

contract TestContract {
    storage: Holder;
    init() {
        self.storage = Holder{
            intVal: 99,
            strStruct: StringStruct{
                s: "abc",
                optS: null,
                flag: true
            }
        };
    }
}