struct InnerStruct {
    sField: String;
    intField: Int;
    boolField: Bool;
}

struct MiddleStruct {
    inner: InnerStruct;
    string2: String;
}

contract ComplexContract {
    a: Int = 0;
    mid: MiddleStruct = MiddleStruct{
        inner: InnerStruct{
            sField: "hi",
            intField: 123,
            boolField: false,
        },
        string2: "hey",
    };

    receive() {
    }
}