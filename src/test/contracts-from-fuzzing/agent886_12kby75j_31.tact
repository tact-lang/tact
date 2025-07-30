message(0xABCD) M1 { foo: Int }
message(0x1234) M2 { bar: Bool }

struct Container {
    m1: M1?;
    m2: M2?;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            m1: M1{ foo: 3 },
            m2: null
        };
    }
}