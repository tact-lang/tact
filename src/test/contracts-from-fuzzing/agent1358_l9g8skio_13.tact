struct Inner { x: Int; }
struct Outer { y: Bool; inner: Inner; }

contract InlineNested {
    data: Outer;

    init() {
        self.data = Outer {
            y: false,
            inner: Inner { x: 99 }
        };
    }
}