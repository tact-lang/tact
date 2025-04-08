struct Middle {
    a: Int;
    b: String;
}

struct Wrapper {
    m: Middle?;
}

contract OptionalMiddleTest {
    val: Wrapper;

    init() {
        self.val = Wrapper{m: null};
    }
}