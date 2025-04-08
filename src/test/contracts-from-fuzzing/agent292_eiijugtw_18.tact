struct Nested1 {
    a: Int;
}
struct Nested2 {
    b: Bool;
    inner: Nested1;
}
contract MixedNest {
    s: Nested2;

    init() {
        self.s = Nested2{b:true, inner: Nested1{a:42}};
    }
}