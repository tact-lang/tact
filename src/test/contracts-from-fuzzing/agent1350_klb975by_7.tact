struct DeeplyNested {
    inner: Struct2;
}

struct Struct2 {
    nested: Struct3;
}

struct Struct3 {
    flag: Bool;
    text: String;
    number: Int;
}

contract DeepNestingTest {
    val: DeeplyNested;

    init() {
        self.val = DeeplyNested{
            inner: Struct2{
                nested: Struct3{
                    flag:true,
                    text:"a",
                    number:7
                }
            }
        };
    }
}