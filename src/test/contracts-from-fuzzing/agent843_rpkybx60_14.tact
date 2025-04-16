struct DefaultsMany {
    a: Int = 1;
    b: Bool?;
    c: Bool? = false;
    d: Int? = null;
    e: Int = 2;
}

contract DefaultsEdge {
    f: DefaultsMany;

    init() {
        self.f = DefaultsMany{
            a: 10, b: true, c: null, d: 123, e: 20
        };
    }
}
