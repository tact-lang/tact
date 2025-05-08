struct ComponentA {
    x: Int;
    y: Bool;
}

struct ComponentB {
    s: String;
    n: Int;
}

contract OptionalNestedStructs {
    ca: ComponentA? = null;
    cb: ComponentB? = null;

    init() {
        self.ca = null;
        self.cb = null;
    }
}