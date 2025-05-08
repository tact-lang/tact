// deeply nested optionals, chain is partially filled
struct A { x: Int?; }
struct B { y: A?; }
struct C { z: B?; }

contract Test {
    c: C = C{z: null};
    optX: Int? = null;
    init() {}
}