struct InitializeAll {
    a: Int;
    b: Bool;
    c: Int?;
    d: String?;
    e: Address;
    f: Address?;
}

contract InitStructFull {
    val: InitializeAll;

    init() {
        self.val = InitializeAll{
            a: 1,
            b: false,
            c: null,
            d: null,
            e: myAddress(),
            f: null
        };
    }
}