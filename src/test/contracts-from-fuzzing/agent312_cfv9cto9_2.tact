struct InnerMost { x: Int; }

struct Middle { inner: InnerMost; }

contract TestContract {
    data: Middle;

    init() {
        self.data = Middle{ inner: InnerMost{ x: 7 } };
    }
}