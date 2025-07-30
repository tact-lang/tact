// optional struct field inside contract plus default optional inside struct
struct Inner {
    foo: Int?;
}

contract Test {
    data: Inner?;

    init() {
        self.data = null;
    }
}
