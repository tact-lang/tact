struct BigNest {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    flag: Bool;
    text: String;
}

struct Inner2 {
    inner3: Inner3;
    number: Int;
}

struct Inner3 {
    someText: String;
    optBool: Bool?;
    optInt: Int?;
}

contract TestContract {
    data: BigNest;

    init() {
        self.data = BigNest{
            inner1: Inner1{ flag: true, text: "Hello" },
            inner2: Inner2{
                inner3: Inner3{ someText: "Nested", optBool: null, optInt: 42 },
                number: 7
            }
        };
    }
}