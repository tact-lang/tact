struct Innermost {
    a: Int;
}
struct Inner {
    b: Innermost;
}
contract NestedAnon {
    i: Inner;
    init() {
        self.i = Inner{b: Innermost{a:7}};
    }
}