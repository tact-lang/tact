struct OptionalNested {
    val: Int?;
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    o: OptionalNested;
    
    init() {
        self.o = OptionalNested{ val: null, nested: null };
    }
}