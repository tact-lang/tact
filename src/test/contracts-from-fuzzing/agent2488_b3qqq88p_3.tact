struct Nesty {
    one: Int;
    two: Int;
}

contract TestOptNested {
    nested: Nesty?;

    init() {
        self.nested = null;
    }
}