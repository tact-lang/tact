struct NestedOptionalTest {
    point: Point?;
}

struct Point {
    x: Int;
    y: Int;
}

contract TestContract {
    testStruct: NestedOptionalTest;

    init() {
        self.testStruct = NestedOptionalTest{point: null};
    }
}
