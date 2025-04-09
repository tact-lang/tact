struct Nested1 { inner: Nested2 }
struct Nested2 { inner: Nested3 }
struct Nested3 { inner: Nested4 }
struct Nested4 { inner: Nested5 }
struct Nested5 { inner: Int }

contract NestedStructDepthTest {
    s: Nested1;

    init() {
        self.s = Nested1{
            inner: Nested2{
                inner: Nested3{
                    inner: Nested4{
                        inner: Nested5{
                            inner: 42
                        }
                    }
                }
            }
        };
    }
}