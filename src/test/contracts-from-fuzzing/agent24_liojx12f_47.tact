// persistent storage: deeply nested optional chain filled plus loose optional fields
struct A { x: Int?; }
struct B { y: A?; }
struct C { z: B?; }

contract Test {
    c: C = C{z: B{y: A{x: 123}}};
    optI: Int? = null;
    optStr: String? = null;
    optBool: Bool? = null;
    init() {}
}