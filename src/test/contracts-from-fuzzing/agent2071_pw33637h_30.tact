struct Encapsulated {
    inner: Middle;
}

struct Middle {
    core: Core;
}

struct Core {
    x: Int;
    y: Bool;
}

contract TwoEncaps {
    f1: Encapsulated;
    f2: Encapsulated;

    init() {
        self.f1 = Encapsulated{ inner: Middle{ core: Core{ x: 1, y:true } } };
        self.f2 = Encapsulated{ inner: Middle{ core: Core{ x: 2, y:false } } };
    }
}