struct Combo {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address?;
    optInt: Int?;
    optStr: String?;
    nested: InnerCombo;
}

struct InnerCombo {
    number: Int;
    flag: Bool;
    comment: String?;
}

contract TestContract {
    combo: Combo = Combo{
        intVal: 777,
        boolVal: true,
        strVal: "hi",
        addrVal: null,
        optInt: null,
        optStr: null,
        nested: InnerCombo{
            number: 5,
            flag: false,
            comment: "text"
        }
    };
}