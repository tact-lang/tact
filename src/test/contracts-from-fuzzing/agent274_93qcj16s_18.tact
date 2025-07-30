struct LargerLevel2 {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
}

struct LargerLevel1 {
    nested: LargerLevel2;
    count: Int;
}

contract LargerNestedTest {
    data: LargerLevel1;

    init() {
        self.data = LargerLevel1{
            nested: LargerLevel2{
                f1: 11,
                f2: true,
                f3: "ok",
                f4: myAddress(),
            },
            count: 100,
        };
    }
}