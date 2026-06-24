struct NestedComb {
    a: Int;
    b: Combo;
    c: Bool;
}

struct Combo {
    inner: InnerCombo;
    count: Int;
}

struct InnerCombo {
    b: Bool?;
    s: String;
}

contract NestedComboTest {
    data: NestedComb;

    init() {
        self.data = NestedComb{
            a: 1,
            b: Combo{
                inner: InnerCombo{
                    b: null,
                    s: "hello"
                },
                count: 5
            },
            c: false
        };
    }
}