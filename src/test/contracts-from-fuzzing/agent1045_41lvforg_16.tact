// deeply layered optional nested struct

struct Inner {
    val: Int?;
}

struct Wrapper {
    content: Inner?;
}

contract TestContract {
    state: Wrapper;

    init() {
        self.state = Wrapper{content: Inner{val: null}};
    }
}