struct Inner1 {
    flag: Bool;
}
struct Inner2 {
    inner1: Inner1;
}
struct Inner3 {
    inner2: Inner2;
}

contract Chain {
    data: Inner3;
    init() {
        self.data = Inner3{ inner2: Inner2{ inner1: Inner1{ flag: false } } };
    }
}