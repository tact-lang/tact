struct Layer3 {
    s: String;
}

struct Layer2 {
    i: Int;
    nested: Layer3;
}

struct Layer1 {
    flag: Bool;
    nested: Layer2;
}

contract MixedNestedTest {
    val: Layer1;

    init() {
        self.val = Layer1{
            flag: true,
            nested: Layer2{
                i: 10,
                nested: Layer3{
                    s: "deep"
                }
            }
        };
    }
}