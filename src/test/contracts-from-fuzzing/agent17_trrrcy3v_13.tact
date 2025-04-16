struct NestOptDefault {
    a: Int? = null;
    b: String = "";
}

struct Wrapper {
    inner: NestOptDefault;
}

contract NestedOptDefaultTest {
    val: Wrapper;

    init() {
        self.val = Wrapper{ inner: NestOptDefault{} };
    }
}