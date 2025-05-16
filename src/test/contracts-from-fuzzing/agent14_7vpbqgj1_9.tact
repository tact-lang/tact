struct C {
    val: Int;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract Test {
    receive() {
        let a: A = A{
            b: B{
                c: C{ val: 999 }
            }
        };
    }
}
