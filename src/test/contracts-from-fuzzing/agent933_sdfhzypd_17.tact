struct Holder1 {
    intF: Int;
}

struct Holder2 {
    boolF: Bool;
}

struct Holder3 {
    strF: String;
}

struct BigHolder {
    h1: Holder1;
    h2: Holder2;
    h3: Holder3;
}

contract Test {
    big: BigHolder;
    init() {
        self.big = BigHolder{
            h1: Holder1{ intF: 10 },
            h2: Holder2{ boolF: true },
            h3: Holder3{ strF: "abc" }
        };
    }
}