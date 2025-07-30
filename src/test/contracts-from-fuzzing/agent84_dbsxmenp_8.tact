struct Level3 {
    val: Int;
    flag: Bool;
}

struct Level2 {
    nested: Level3;
    msg: String;
}

struct Level1 {
    nested: Level2;
    addr: Address;
}

contract DeepFieldsTest {
    data: Level1;
    init() {
        self.data = Level1{
            nested: Level2{
                nested: Level3{
                    val: 999,
                    flag: true,
                },
                msg: "hi",
            },
            addr: myAddress(),
        };
    }
}
