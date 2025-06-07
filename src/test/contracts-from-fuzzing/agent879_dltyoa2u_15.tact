struct RecursionTest1 {
    val: Int;
}

struct RecursionTest2 {
    nested: RecursionTest1?;
}

struct RecursionTest3 {
    holder: RecursionTest2;
}

contract RecursionOptTest {
    test: RecursionTest3;

    init() {
        self.test = RecursionTest3 {
            holder: RecursionTest2 {
                nested: null
            }
        };
    }
}
