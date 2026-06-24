struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: String;
}

contract MultiInner {
    x: Inner1;
    y: Inner2;
    init() {
        self.x = Inner1{a: 1};
        self.y = Inner2{b: "hi"};
    }
}