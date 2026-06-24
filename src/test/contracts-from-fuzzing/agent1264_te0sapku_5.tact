struct Level3 {
    bigInt: Int;
    flag: Bool?;
}

struct Level2 {
    nest: Level3;
    text: String;
}

struct Level1 {
    inner: Level2;
    count: Int;
    marker: Cell?;
}

contract TripleNestedTest {
    value: Level1;

    init() {
        self.value = Level1{
            inner: Level2{
                nest: Level3{bigInt: 99, flag: null},
                text: "hello"
            },
            count: 123,
            marker: null
        };
    }
}
