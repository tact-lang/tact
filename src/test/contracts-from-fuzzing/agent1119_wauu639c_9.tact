struct Flat {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address?;
    f5: Bool?;
    f6: String?;
    f7: Int?;
    f8: Int as int64;
    f9: Int as uint64;
}

contract TestContract {
    flat: Flat;

    init() {
        self.flat = Flat{
            f1: 1,
            f2: true,
            f3: "abc",
            f4: null,
            f5: null,
            f6: null,
            f7: null,
            f8: -1000000,
            f9: 1000000,
        };
    }
}