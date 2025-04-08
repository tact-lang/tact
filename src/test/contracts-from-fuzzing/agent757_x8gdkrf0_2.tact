struct Inner { v: Int; }
struct Middle { inner: Inner; }
struct Outer { middle: Middle; }

contract TestContract {
    persist: Outer;

    init() {
        self.persist = Outer{
            middle: Middle{
                inner: Inner{v: 1}
            }
        };
    }
}