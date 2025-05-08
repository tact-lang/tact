// optional struct containing nested optional struct
struct Inner {
    val: Int;
}

struct Container {
    inner: Inner?;
}

contract Out {
    x: Container?;

    init() {
        self.x = null;
    }
}