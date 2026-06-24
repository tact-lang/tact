struct A {
    f1: Int = 1;
    f2: Bool = false;
}

struct B {
    g1: String = "";
    g2: Address?;
    g3: A;
}

contract TestContract {
    b: B = B{ g3: A{} };
}