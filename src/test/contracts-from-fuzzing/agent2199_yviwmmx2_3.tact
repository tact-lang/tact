struct Inner {
    nested: Inner2;
}

struct Inner2 {
    val: Int;
    flag: Bool;
}

contract DeepTest {
    data: Inner;
    init() {
        self.data = Inner{nested: Inner2{val: 42, flag: false}};
    }
}
