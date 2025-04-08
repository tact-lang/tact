struct InnerMost { a: Int; }

struct Inner { 
    x: InnerMost; 
    y: Int?; 
}

contract NestedOptionals {
    data: Inner;
    init() {
        self.data = Inner{ x: InnerMost{ a: 7 }, y: null };
    }
}