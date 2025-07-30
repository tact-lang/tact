struct InnerMost {n: Int}
struct Middle { inner: InnerMost }
struct OuterMost { middle: Middle }

contract OuterMostContract {
    payload: OuterMost;

    init() {
        self.payload = OuterMost{
            middle: Middle{
                inner: InnerMost{n:7}
            }
        };
    }
}