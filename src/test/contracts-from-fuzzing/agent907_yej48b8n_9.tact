struct DefaultsAndOptionals {
    a: Int = 5;
    b: Bool = false;
    c: String = "ok";
    d: Int?; // defaults to null implicitly
    e: Bool?; // defaults to null implicitly
}

contract DefaultsEdge {
    s: DefaultsAndOptionals;

    init() {
        self.s = DefaultsAndOptionals{};
    }
}