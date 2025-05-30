struct First {
    sub: Second;
}

struct Second {
    third: Third;
}

struct Third {
    field: Int;
}

contract SuperDeepNest {
    root: First;
    init() {
        self.root = First{ sub: Second{ third: Third{ field: 5 } } };
    }
}