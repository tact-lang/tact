struct Child { val: Int; }

contract OptionalChild {
    f: Child?;
    init() { self.f = null; }
}