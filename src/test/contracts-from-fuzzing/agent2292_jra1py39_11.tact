struct Fancy {
    s1: String;
    s2: String;
    n: Int;
    flag: Bool?;
}

contract StringsOptions {
    f: Fancy;

    init() {
        self.f = Fancy{
            s1: "abc",
            s2: "def",
            n: 12345,
            flag: null
        };
    }
}