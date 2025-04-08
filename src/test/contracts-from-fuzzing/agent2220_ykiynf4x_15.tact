struct B {
    q1: Int = 7;
    q2: Bool = true;
    q3: String = "xyz";
}

struct A {
    b: B = B{};
    y: Int = 42;
}

contract Test {
    f: A = A{};
}