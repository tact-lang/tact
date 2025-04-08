struct InnerMost { val: Int }
struct Inner { val: InnerMost }
struct Middle { val: Inner }
struct Outer { val: Middle }

contract DeepOptionals {
    state: Outer?;

    init() {
        self.state = null;
    }
}