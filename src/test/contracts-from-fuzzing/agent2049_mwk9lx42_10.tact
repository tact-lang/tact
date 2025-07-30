struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Int;
}

struct Inner3 {
    z: Int;
}

struct Mix {
    a: Inner1;
    b: Inner2;
    c: Inner3;
    d: Bool;
    e: Address;
}

contract Test {
    data: Mix;

    init() {
        self.data = Mix{
            a: Inner1{ x: 11 },
            b: Inner2{ y: 22 },
            c: Inner3{ z: 33 },
            d: false,
            e: myAddress()
        };
    }
}