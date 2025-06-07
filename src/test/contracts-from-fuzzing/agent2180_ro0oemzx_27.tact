struct InnerBool {
    val: Bool;
}

struct NestedMany {
    a: Int;
    s1: InnerBool;
    s2: InnerBool;
    done: Bool;
}

contract ManyNestedBools {
    content: NestedMany;

    init() {
        self.content = NestedMany{
            a: 9,
            s1: InnerBool{ val: true },
            s2: InnerBool{ val: false },
            done: true
        };
    }
}