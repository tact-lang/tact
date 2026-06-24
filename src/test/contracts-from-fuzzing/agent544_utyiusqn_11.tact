struct Inner1 { a: Int; }
struct Inner2 { b: Inner1; }
struct Inner3 { c: Inner2; }
struct Inner4 { d: Inner3; }
struct Inner5 { e: Inner4; }

struct Top {
    z: Inner5;
    x: Int;
    y: Bool;
}

contract TestContract {
    v: Top;

    init() {
        self.v = Top{
            z: Inner5{
                e: Inner4{
                    d: Inner3{
                        c: Inner2{
                            b: Inner1{
                                a: 99
                            }
                        }
                    }
                }
            },
            x: 1,
            y: true,
        };
    }
}