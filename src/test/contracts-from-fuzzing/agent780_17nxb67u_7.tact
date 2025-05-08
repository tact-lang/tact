struct Inner1 {
    x: Int = 10;
}

struct Inner2 {
    y: Int?;
    z: Bool = false;
}

struct Combined {
    a: Inner1;
    b: Inner2;
}

contract CombinedStructs {
    store: Combined;

    init() {
        self.store = Combined{
            a: Inner1{},
            b: Inner2{ y: null, z: false }
        };
    }
}