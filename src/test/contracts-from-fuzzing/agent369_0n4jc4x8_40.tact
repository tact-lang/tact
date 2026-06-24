struct NestedDupeNames {
    a: Int;
    inner: InnerDupe;
}

struct InnerDupe {
    a: Int;
    b: Bool;
}

contract NestedDupeNamesTest {
    val: NestedDupeNames;

    init() {
        self.val = NestedDupeNames{
            a: 1,
            inner: InnerDupe{
                a: 2,
                b: true,
            },
        };
    }
}