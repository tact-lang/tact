struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct HasNested {
    inner: NestedOptionals?;
}

contract TestContract {
    data: HasNested;

    init() {
        self.data = HasNested{ inner: null };
    }
}