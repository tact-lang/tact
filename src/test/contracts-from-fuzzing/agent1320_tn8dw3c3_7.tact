struct NestedOptionals {
    a: Int?;
    b: String?;
    c: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract NestedOptionTest {
    data: NestedOptionals = NestedOptionals{ a: null, b: null, c: null };

    receive() {
        self.data = NestedOptionals{
            a: 100,
            b: "test",
            c: InnerOpt{ x: 1, y: true }
        };
    }
}