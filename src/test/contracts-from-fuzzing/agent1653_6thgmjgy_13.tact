// Optional message struct field inside contract data
message(1) M1 {
    a: Int;
}

struct Container {
    m: M1?;
    k: Int;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            m: null,
            k: 123
        };
    }
}