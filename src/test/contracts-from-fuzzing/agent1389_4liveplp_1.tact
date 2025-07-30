struct NestedLevel {
    x: Int;
    y: Bool;
}

struct OuterLevel {
    inner: NestedLevel;
    flag: Bool;
}

contract NestingFuzz {
    myField: OuterLevel;

    init() {
        self.myField = OuterLevel{
            inner: NestedLevel{
                x: 42,
                y: false
            },
            flag: true
        };
    }
}