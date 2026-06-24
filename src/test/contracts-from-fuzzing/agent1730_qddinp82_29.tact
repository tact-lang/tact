struct Sub {
    subVal: Int?;
}

struct Root {
    s: Sub?;
}

contract OptNullInit {
    field: Root;

    init() {
        self.field = Root{ s: null };
    }
}