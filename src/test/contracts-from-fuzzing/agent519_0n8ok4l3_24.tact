struct Recursive1 {
    val: Int;
}

struct Recursive2 {
    inner: Recursive1;
}

struct Recursive3 {
    inner: Recursive2;
}

contract DeepRecursionTest {
    data: Recursive3;

    init() {
        self.data = Recursive3 {
            inner: Recursive2 {
                inner: Recursive1 {
                    val: 77
                }
            }
        };
    }
}