message(42) M42 { val: Int }

struct Inner {
    m42: M42?;
    intVal: Int?;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null
        };
    }
}