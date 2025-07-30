struct Nested {
    val: Int;
}

struct Container {
    nested: Nested?;
}

contract TestContract {
    container: Container;
    
    init() {
        self.container = Container{ nested: null };
    }
}