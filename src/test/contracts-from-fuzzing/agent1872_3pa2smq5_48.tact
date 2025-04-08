// mix message structs and normal structs
struct S {
    x: Int;
    y: String?;
}

message(77) M {
    s: S;
    flag: Bool;
}

contract MixMsgAndStruct {
    m: M;
    init() {
        self.m = M{ s: S{ x: 1, y: "yes" }, flag: true };
    }
}