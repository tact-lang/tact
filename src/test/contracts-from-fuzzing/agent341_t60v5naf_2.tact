struct First {
    x: Int;
}

struct Second {
    f: First;
}

struct Third {
    s: Second;
}

contract DeepNested {
    deep: Third;

    init() {
        self.deep = Third{ s: Second{ f: First{ x: 42 } } };
    }
}