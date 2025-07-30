// persistent nested optionals with Int = null at the end
struct A { val: Int?; }
struct B { a: A?; }
struct C { b: B?; }

contract Test {
    c: C = C{b: B{a: A{val:null}}};
    init() {}
}