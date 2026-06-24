struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int;
    x: Inner1;
}

struct Inner3 {
    c: Int;
    y: Inner2;
}

struct Inner4 {
    d: Int;
    z: Inner3;
}

struct Inner5 {
    e: Int;
    q: Inner4;
}

contract TestContract {
    data: Inner5;

    init() {
        self.data = Inner5{
            e: 11,
            q: Inner4{
                d: 22,
                z: Inner3{
                    c: 33,
                    y: Inner2{
                        b: 44,
                        x: Inner1{ a: 55 }
                    }
                }
            }
        };
    }

    receive() {}
}