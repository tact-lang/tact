struct Level2 {
    b: Bool;
    c: String?;
}

struct Level1 {
    a: Int;
    nested: Level2;
}

contract DeepNestTest {
    nestedStruct: Level1;

    init() {
        self.nestedStruct = Level1{
            a: 5,
            nested: Level2{
                b: true,
                c: "hello"
            }
        };
    }
}