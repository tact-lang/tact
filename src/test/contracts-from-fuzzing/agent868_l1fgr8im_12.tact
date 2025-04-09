struct DeeplyNestedOptionals {
    a: Int?;
    b: Bool?;
    c: InnerStruct?;
}

struct InnerStruct {
    num: Int as uint16;
    flag: Bool;
    txt: String;
}

contract TestContract {
    dno: DeeplyNestedOptionals = DeeplyNestedOptionals{
        a: null,
        b: null,
        c: null
    };

    receive() {}
}