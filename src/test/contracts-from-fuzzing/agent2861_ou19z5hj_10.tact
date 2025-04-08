struct OptionalString {
    s: String?;
}

struct Container {
    item: OptionalString;
}

contract OptionalStringNested {
    c: Container;

    init() {
        self.c = Container{
            item: OptionalString{ s: null }
        };
    }
}