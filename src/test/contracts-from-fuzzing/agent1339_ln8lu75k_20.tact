struct Nested1 { val: Int; }
struct Nested2 { inner: Nested1; }
struct Nested3 { inner: Nested2; }
struct Nested4 { inner: Nested3; }
struct Nested5 { inner: Nested4; }

contract VeryDeepNesting {
    d: Nested5;

    init() {
        self.d = Nested5{
            inner: Nested4{
                inner: Nested3{
                    inner: Nested2{
                        inner: Nested1{
                            val: 999
                        }
                    }
                }
            }
        };
    }
}