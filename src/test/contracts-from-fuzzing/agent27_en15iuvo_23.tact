struct First {a: Int}
struct Second {b: First}
struct Third {c: Second}

contract MultiNest {
    all: Third;
    init() {
        self.all = Third{ c: Second{ b: First{ a:777 } } };
    }
}