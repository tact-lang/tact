struct Inner {
    flag: Bool;
    val: Int;
}

struct Wrapper {
    inner: Inner?;
}

contract Test {
    state: Wrapper = Wrapper{inner: null};

    init() {
        self.state = Wrapper{inner: Inner{flag: true, val: 9}};
    }
}