struct Inner {
    x: Int?;
}

struct Outer {
    inner: Inner?;
}

contract EmptyNestedInit {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{} };
    }
}