// contract with several nested structs with serialization annotations
struct Inner {
    x: Int as uint8;
    y: Int as int16;
}
struct Container {
    a: Int as uint32;
    b: Inner;
}
contract TestContract {
    c: Container = Container{
        a: 123,
        b: Inner{ x: 5, y: 50 }
    };
    init() {
        self.c = Container{
            a: 456,
            b: Inner{ x: 15, y: -30 }
        };
    }
}
