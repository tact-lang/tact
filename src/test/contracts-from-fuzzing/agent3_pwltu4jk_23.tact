// Contract with cross-combinations of optionals and nested structs
struct InnerNested {
    a: Int;
    b: Bool?;
}

struct OuterNested {
    inn: InnerNested?;
    s: String;
}

contract ComboCross {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            inn: InnerNested{
                a: 99,
                b: null
            },
            s: "hi"
        };
    }
}