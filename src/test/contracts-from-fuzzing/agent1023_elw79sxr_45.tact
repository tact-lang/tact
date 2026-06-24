struct RecursiveStruct {
    child: RecursiveChild;
}

struct RecursiveChild {
    foo: Int;
}

contract RecursiveTest {
    root: RecursiveStruct;

    init() {
        self.root = RecursiveStruct{ child: RecursiveChild{ foo: 42 } };
    }
}