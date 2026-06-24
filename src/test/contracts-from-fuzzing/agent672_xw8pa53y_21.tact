// Optional containing struct with defaults
struct MyInner {
    x: Int = 5;
    y: Bool = true;
}

struct MyOuter {
    inner: MyInner?;
}

contract OptWithDefaultsField {
    data: MyOuter;
    init() {
        self.data = MyOuter{ inner: null };
    }
}
