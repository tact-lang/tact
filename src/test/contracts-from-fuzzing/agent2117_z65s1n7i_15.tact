struct DefaultInner {
    x: Int = 10;
    y: Bool = false;
}

struct DefaultOuter {
    z: Int = 20;
    inner: DefaultInner = DefaultInner{};
}

contract DefaultNestedContract {
    storage: DefaultOuter;
    init() {
        self.storage = DefaultOuter{};
    }
}