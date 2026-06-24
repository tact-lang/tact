struct BigData {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int;
    f6: Bool;
    f7: String;
    f8: Address;
    f9: Int;
    f10: Bool;
    f11: String;
    f12: Address;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Address;
}

contract BigStorageTest {
    s: BigData;

    init() {
        self.s = BigData{
            f1: 1,
            f2: true,
            f3: "A",
            f4: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            f5: 5,
            f6: false,
            f7: "B",
            f8: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            f9: 9,
            f10: true,
            f11: "C",
            f12: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            f13: 13,
            f14: false,
            f15: "D",
            f16: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
        };
    }

    receive() {}
}