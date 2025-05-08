struct Bottom {
    tiny: Int as uint3 = 5;
    flag: Bool?;
}

struct Middle {
    inner: Bottom?;
    label: String = "abc";
}

struct Top {
    mid: Middle;
    count: Int as uint32 = 123456789;
}

contract TestContract {
    state: Top;
    init() {
        self.state = Top{ mid: Middle{ inner: null } };
    }
}