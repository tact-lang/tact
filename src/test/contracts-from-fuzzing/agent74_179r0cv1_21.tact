struct InnerMost { val: Int; }

struct Middle { inner: InnerMost?; }

struct Outer { mid: Middle?; }

contract TestContract {
    payload: Outer;

    init() {
        self.payload = Outer{
            mid: Middle{
                inner: InnerMost{ val: 42 }
            }
        };
    }
}