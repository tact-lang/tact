struct InnerMost { a: Int; }
struct Inner { b: Int; im: InnerMost; }
struct Mid { c: Int; inner: Inner; }
struct Outer { d: Int; mid: Mid; }

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            d:1, mid: Mid{
                c:2, inner: Inner{
                    b:3, im: InnerMost{ a:4 }
                }
            }
        };
    }
}