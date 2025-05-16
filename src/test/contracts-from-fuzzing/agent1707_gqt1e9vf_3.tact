struct DeepNested {
    inner1: Int;
    inner2: Bool;
}

struct Higher {
    s: DeepNested;
    flag2: Bool;
}

contract ManyNested {
    val: Higher;

    init() {
        self.val = Higher{
            s: DeepNested{ inner1: 5, inner2: false },
            flag2: true
        };
    }
}