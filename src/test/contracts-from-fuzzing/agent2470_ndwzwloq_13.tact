struct MixOpt {
    intVal: Int;
    maybeInt: Int?;
    strVal: String;
    maybeStr: String?;
    boolVal: Bool;
    maybeBool: Bool?;
}

contract MixOptContract {
    s: MixOpt = MixOpt{
        intVal: 1,
        maybeInt: null,
        strVal: "",
        maybeStr: null,
        boolVal: false,
        maybeBool: null,
    };
}