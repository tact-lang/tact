struct NestedOptionals {
    x: Int?;
    y: Bool?;
}

struct OptionalStructContainer {
    nested: NestedOptionals?;
}

contract OptionalNestedTest {
    container: OptionalStructContainer;
    
    init() {
        self.container = OptionalStructContainer { nested: null };
    }
}