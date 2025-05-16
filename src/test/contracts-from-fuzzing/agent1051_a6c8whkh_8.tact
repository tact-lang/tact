struct Deep {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int?;
    f6: Bool;
    f7: String;
    f8: Address;
    f9: Int;
    f10: Bool;
    f11: String;
    f12: Address;
}

struct Wrap {
    nested: Deep;
}

contract TestContract {
    container: Wrap;
    init() {
        self.container = Wrap{
            nested: Deep{
                f1: 1,
                f2: false,
                f3: "a",
                f4: myAddress(),
                f5: null,
                f6: true,
                f7: "b",
                f8: myAddress(),
                f9: 123,
                f10: false,
                f11: "c",
                f12: myAddress()
            }
        };
    }
}