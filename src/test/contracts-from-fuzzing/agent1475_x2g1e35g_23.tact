struct HasString {
    s: String;
}

struct HasInt {
    i: Int;
}

struct Combo {
    a: Int;
    strct: HasString;
    intval: HasInt;
    opt: String?;
}

contract MixedStruct {
    val: Combo;

    init() {
        self.val = Combo{
            a: 5,
            strct: HasString{s: "ok"},
            intval: HasInt{i: 6},
            opt: null,
        };
    }
}