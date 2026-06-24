struct NestedStructLevel2 {
    a: Int;
    b: Bool;
}

struct NestedStructLevel1 {
    x: Int;
    y: NestedStructLevel2;
}

contract NestedStructTest {
    data: NestedStructLevel1;
    init() {
        self.data = NestedStructLevel1{
            x: 5,
            y: NestedStructLevel2{ a: 10, b: true }
        };
    }
}