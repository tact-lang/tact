struct Inner { x: Int? }

struct Mid { inner: Inner? }

struct Outer { mid: Mid? }

contract DeepOptionals {
    s: Outer;

    init() {
        self.s = Outer{ mid: Mid{ inner: Inner{ x: null } } };
    }
}