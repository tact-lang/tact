// optional struct containing optional fields
struct Inner { val: Int?; }

struct Outer { inner: Inner?; label: String; }

contract Test {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner: Inner{ val: null },
            label: "ok"
        };
    }
}