struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct ManyNestedOptionals {
    level1: MultiOptional?;
    level2: MultiOptional?;
}

contract ManyNestedOptionalsTest {
    data: ManyNestedOptionals;

    init() {
        self.data = ManyNestedOptionals{
            level1: null,
            level2: null
        };
    }

    receive() {
        let _ = self.data.level2;
    }
}