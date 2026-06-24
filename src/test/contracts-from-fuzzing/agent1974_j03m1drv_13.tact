struct InnerMost {
    leafValue: Int;
    optionalLeaf: Int?;
}

struct Layer2 {
    inmost: InnerMost;
    flag: Bool;
}

struct Layer1 {
    mid: Layer2;
    extra: Int?;
}

contract NestingTest {
    val: Layer1;

    init() {
        self.val = Layer1{
            mid: Layer2{
                inmost: InnerMost{ leafValue: 5, optionalLeaf: null },
                flag: true
            },
            extra: null
        };
    }
}
