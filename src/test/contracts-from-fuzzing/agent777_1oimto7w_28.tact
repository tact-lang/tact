struct Inner1 {
    s: String;
}

struct Inner2 {
    inner1: Inner1;
    flag: Bool;
}

contract CrossNested {
    data: Inner2;

    init() {
        self.data = Inner2{
            inner1: Inner1{ s: "x" },
            flag: true
        };
    }
}