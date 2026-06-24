struct Nested1 {
    val1: Int;
    val2: Bool;
}

struct Nested2 {
    inner: Nested1;
    optVal: String?;
}

contract TestContract {
    data: Nested2;

    init() {
        self.data = Nested2{
            inner: Nested1{val1: 1, val2: true},
            optVal: null
        };
    }
}