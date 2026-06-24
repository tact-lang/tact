struct Params1 { a: Int; }
struct Params2 { b: Int; nested: Params1; }
struct Params3 { c: Int; nested: Params2; }
struct Params4 { d: Int; nested: Params3; }
struct Params5 { e: Int; nested: Params4; }

contract TestContract {
    field: Params5;

    init() {
        self.field = Params5{
            e: 5,
            nested: Params4{
                d: 4,
                nested: Params3{
                    c: 3,
                    nested: Params2{
                        b: 2,
                        nested: Params1{a: 1},
                    },
                },
            },
        };
    }
}
