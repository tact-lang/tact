struct Child { done: Bool; note: String?; }

struct Container {
    a: Child?;
    b: Child?;
    c: Child?;
}

contract OptionalMany {
    container: Container;

    init() {
        self.container = Container{
            a: null,
            b: null,
            c: null
        };
    }
}