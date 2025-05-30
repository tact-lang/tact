struct Sub {
    val: Int?;
}

struct Outer {
    inner: Sub?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null
        };
    }
}