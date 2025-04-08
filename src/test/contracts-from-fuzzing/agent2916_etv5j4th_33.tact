struct W1 {
    a: Int;
}

struct W2 {
    b: Int;
}

struct W3 {
    w1: W1;
    w2: W2;
    s: String;
}

contract WideNestedContract {
    data: W3;

    init() {
        self.data = W3{
            w1: W1{ a: 1 },
            w2: W2{ b: 2 },
            s: "wide"
        };
    }
}