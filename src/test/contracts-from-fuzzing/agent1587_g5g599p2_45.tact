struct Nested0 { a: Int; }
struct Nested1 { inner: Nested0; }
struct Nested2 { inner: Nested1; }
struct Nested3 { inner: Nested2; }
struct Nested4 { inner: Nested3; }
struct Nested5 { inner: Nested4; }

contract DeepChainX {
    foo: Nested5;
    init() {
        self.foo = Nested5{
            inner: Nested4{
                inner: Nested3{
                    inner: Nested2{
                        inner: Nested1{
                            inner: Nested0{
                                a: 9
                            }
                        }
                    }
                }
            }
        };
    }
}