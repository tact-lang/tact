struct LayeredDefaults {
    a: Int = 5;
    b: LayeredInner;
}

struct LayeredInner {
    x: Bool = false;
    y: String = "z";
}

contract TestContract {
    data: LayeredDefaults;

    init() {
        self.data = LayeredDefaults{ b: LayeredInner{} };
    }
}