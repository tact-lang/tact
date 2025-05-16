struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Bool;
}

struct Top {
    i1: Inner1;
    i2: Inner2;
    text: String;
    optionalFlag: Bool?;
}

contract TestContract {
    payload: Top;

    init() {
        self.payload = Top{
            i1: Inner1{ x: 5 },
            i2: Inner2{ y: true },
            text: "abc",
            optionalFlag: null,
        };
    }

    receive() {
        self.payload = self.payload;
    }
}