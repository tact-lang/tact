struct NestedStrings {
    s1: String;
    s2: String;
    s3: String;
}

struct Combo {
    inner: NestedStrings;
    flag: Bool;
    optNum: Int?;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            inner: NestedStrings{ s1:"one", s2:"two", s3:"three" },
            flag: true,
            optNum: null,
        };
    }
}