struct Info {
    foo: Int;
}

struct Data {
    a: Info?;
    b: Info?;
}

contract TestContract {
    d: Data;

    init() {
        self.d = Data{
            a: Info{ foo: 1 },
            b: null
        };
    }

    receive() {}
}