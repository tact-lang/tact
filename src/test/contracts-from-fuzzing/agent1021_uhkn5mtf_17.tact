// Test struct nesting using optional fields with defaults
struct C {
    x: Int = 1;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract OptionalChainField {
    chain: A = A{
        b: null,
    };
}