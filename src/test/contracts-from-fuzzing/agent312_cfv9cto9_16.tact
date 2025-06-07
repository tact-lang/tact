struct Inner { note: String; }

struct Outer { desc: String; inner: Inner; }

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{ desc: "outer", inner: Inner{ note: "inner" } };
    }
}