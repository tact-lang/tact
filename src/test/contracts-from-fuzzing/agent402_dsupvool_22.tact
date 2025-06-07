struct InnerMost { v: Int; }
struct Inner { im: InnerMost?; }
struct Outer { inr: Inner?; }

contract TestContract {
    data: Outer?;

    init() {
        self.data = Outer{
            inr: Inner{
                im: null
            }
        };
    }
}