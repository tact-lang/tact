struct DefaultInner {
    x: Int = 1;
}

struct DefaultOuter {
    y: Int = 2;
    z: DefaultInner = DefaultInner{};
}

contract DefaultParams {
    d: DefaultOuter;
    init() {
        self.d = DefaultOuter{};
    }
}