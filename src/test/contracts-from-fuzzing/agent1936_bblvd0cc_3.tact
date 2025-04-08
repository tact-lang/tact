struct Inner {
    value: Int;
}

struct Outer {
    innerField: Inner;
    flag: Bool;
}

contract NestedStructStorage {
    val: Outer;

    init() {
        self.val = Outer{
            innerField: Inner{ value: 123 },
            flag: true
        };
    }
}