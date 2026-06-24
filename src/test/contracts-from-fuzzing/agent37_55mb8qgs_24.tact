struct Deep {
    s1: Inner1;
    s2: Inner2;
}

struct Inner1 {
    x: Int;
    y: String?;
}

struct Inner2 {
    z: Bool;
    w: Address;
}

contract MultiStruct {
    data: Deep;

    init() {
        self.data = Deep{
            s1: Inner1{ x: 7, y: null },
            s2: Inner2{ z: false, w: myAddress() }
        };
    }
}
