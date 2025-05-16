// Very deep nested with optionals
struct D4 {
    x: Int?
}

struct D3 {
    child: D4?
}

struct D2 {
    node: D3?
}

struct D1 {
    item: D2?
}

contract VeryDeepOptional {
    root: D1;

    init() {
        self.root = D1{
            item: null,
        };
    }
}