// persistent nested optionals with int field at the end = 5
struct A { val: Int?; }
struct B { a: A?; }
struct C { b: B?; }

contract Test {
    c: C = C{b: B{a: A{val:5}}};
    init() {}
}