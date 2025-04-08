struct Nest {
    foo: Int;
    bar: Int?;
}

contract OptDefaultTest {
    val: Nest;

    init() {
        self.val = Nest{ foo: 42 };
    }
}
