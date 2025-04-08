struct InnerMost { val: Int; }
struct Middle { inner: InnerMost; }
struct Outer { middle: Middle; }

contract ThreeLevels {
    state: Outer;

    init() {
        self.state = Outer{
            middle: Middle{
                inner: InnerMost{ val: 9 }
            }
        };
    }
}