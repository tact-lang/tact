struct Inner1 { x: Int; }
struct Inner2 { inner1: Inner1; }
struct Inner3 { inner2: Inner2; }
struct Inner4 { inner3: Inner3; }

contract Deep4Level {
    s: Inner4;

    init() {
        self.s = Inner4{
            inner3: Inner3{
                inner2: Inner2{
                    inner1: Inner1{ x: 123 }
                }
            }
        };
    }
}