struct Opt1 {
    a: Int?;
    b: String?;
}

struct Opt2 {
    nested: Opt1?;
    flag: Bool?;
}

contract NullableStructFields {
    f: Opt2;

    init() {
        self.f = Opt2{
            nested: null,
            flag: null
        };
    }
}