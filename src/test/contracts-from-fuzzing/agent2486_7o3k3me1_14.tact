struct HasOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract MixDefaults {
    data: HasOpt = HasOpt{ a: null, b: true, c: null };
    flag: Bool = false;
    text: String = "hi";
    num: Int = 123;
}