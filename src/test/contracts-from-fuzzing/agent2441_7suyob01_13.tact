struct A {
    x: Int;
    y: Int;
}

struct B {
    a1: A;
    a2: A;
    a3: A;
    a4: A;
    a5: A;
}

contract ManyNestedStructs {
    val: B;

    init() {
        self.val = B{
            a1: A{ x: 1, y: 2 },
            a2: A{ x: 3, y: 4 },
            a3: A{ x: 5, y: 6 },
            a4: A{ x: 7, y: 8 },
            a5: A{ x: 9, y: 10 },
        };
    }
}