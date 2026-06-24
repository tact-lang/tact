struct Inner1 { a: Int; }
struct Inner2 { b: Int; }
struct Inner3 { c: Int; }

struct Mid1 { inner: Inner1; }
struct Mid2 { inner: Inner2; }
struct Mid3 { inner: Inner3; }

struct Top {
    m1: Mid1;
    m2: Mid2;
    m3: Mid3;
}

contract WideNesting {
    store: Top;

    init() {
        self.store = Top{
            m1: Mid1{ inner: Inner1{a:1}},
            m2: Mid2{ inner: Inner2{b:2}},
            m3: Mid3{ inner: Inner3{c:3}}
        };
    }
}