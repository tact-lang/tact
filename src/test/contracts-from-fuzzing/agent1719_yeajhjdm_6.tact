struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: String;
}

contract MultiVars {
    first: Inner1;
    second: Inner2;

    init() {
        self.first = Inner1{a: 7};
        self.second = Inner2{b: "world"};
    }
}