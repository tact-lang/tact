struct C {
    x: Int;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

contract Test {
    receive() {}

    // Getter returning a deeply nested structure
    get fun getDeep(): A {
         return A{ b: B{ c: C{ x: 999 } } };
    }
}
