// Persistent fields, some overridden in constructor, some rely only on default
contract PartialAssign {
    a: Int = 1;
    b: Bool;
    c: Bool = true;

    init() {
        self.b = false;
    }
}