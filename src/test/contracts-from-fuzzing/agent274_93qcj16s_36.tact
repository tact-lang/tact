struct StructOne {
    a: Int;
}

struct StructTwo {
    b: Int;
    inner: StructOne;
}

contract StructNestedNumbers {
    data: StructTwo;

    init() {
        self.data = StructTwo{
            b: 15,
            inner: StructOne{a: 5},
        };
    }
}