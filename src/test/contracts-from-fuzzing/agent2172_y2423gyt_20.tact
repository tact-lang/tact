struct A {
    val: Int;
}

struct B {
    x: Int; 
    inner: A;
}

struct C {
    y: Int?;
    inner: B;
}

contract ManyLevels {
    data: C;

    init() {
        self.data = C{
            y: null,
            inner: B{
                x: 7,
                inner: A{ val: 42 }
            }
        };
    }
}