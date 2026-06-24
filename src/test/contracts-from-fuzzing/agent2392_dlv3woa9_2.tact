struct A {
    f1: Int = 5;
    f2: Bool;
}

struct B {
    nested: A;
    f3: Bool = false;
}

contract DefaultsInNested {
    item: B = B{ nested: A{f2: true}, };
}