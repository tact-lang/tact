struct Small {
    x: Int = 1;
}

struct Larger {
    opt: Small?;
}

contract NullNestedOptional {
    data: Larger;

    init() {
        self.data = Larger{
            opt: null
        };
    }
}