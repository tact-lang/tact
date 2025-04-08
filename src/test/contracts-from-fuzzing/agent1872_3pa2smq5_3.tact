struct X {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool?;
    f5: String;
    f6: Int;
    f7: String?;
    f8: Bool;
    f9: Int;
    f10: String;
}

contract ManyFields {
    data: X;

    init() {
        self.data = X{
            f1: 1, f2: false, f3: "a",
            f4: null, f5: "b", f6: 6,
            f7: "opt", f8: true, f9: 99,
            f10: "zzz",
        };
    }
}