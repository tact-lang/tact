struct AltOptional {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: String;
    f6: String?;
}

contract TestContract {
    data: AltOptional = AltOptional{
        f1: 1,
        f2: null,
        f3: false,
        f4: true,
        f5: "x",
        f6: null,
    };
}