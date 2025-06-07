struct S {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: String;
    f6: String?;
}

contract MixedStruct {
    data: S;
    init() {
        self.data = S{
            f1: 1,
            f2: null,
            f3: true,
            f4: null,
            f5: "ok",
            f6: null,
        };
    }
}
