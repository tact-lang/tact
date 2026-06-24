struct SeveralInts {
    a: Int;
    b: Int;
}

contract ReplaceInitDefaults {
    s: SeveralInts;
    init() {
        self.s = SeveralInts{
            a:10,
            b:20,
        };
    }
}