struct Sub {
    a: Int;
}

struct Container {
    val: Sub?;
}

contract NullableStructContract {
    s: Container;
    init() {
        self.s = Container{
            val: null
        };
    }
}
