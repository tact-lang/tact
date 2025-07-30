struct A {
    b: Bool;
}
struct B {
    a: A;
    c: String;
}
contract Ordering {
    field: B;
    init() {
        self.field = B{
            a: A{b:true},
            c: "order"
        };
    }
}