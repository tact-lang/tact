struct InnerOptional {
    foo: Int?;
}

struct Outer {
    inner: InnerOptional?;
    val: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            val: 123
        };
    }
}