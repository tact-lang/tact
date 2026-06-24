struct Sub {
    val: Int;
}

struct Main {
    sub: Sub?;
}

contract OptionalSubStruct {
    inner: Main;

    init() {
        self.inner = Main{sub: null};
    }
}