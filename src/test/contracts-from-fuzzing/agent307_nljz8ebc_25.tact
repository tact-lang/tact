struct S {
    a: Int;
    flag: Bool?;
}

contract OptionalDefaults {
    val: S;

    init() {
        self.val = S{
            a: 1,
            flag: null,
        };
    }
}