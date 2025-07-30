struct A { foo: Int; }

struct B { a: A?; }

contract OmitNestedOpt {
    s: B = B{};
    init() {}
}