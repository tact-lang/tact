struct Compose1 {
    num: Int;
}

struct Compose2 {
    s: Compose1;
}

struct Compose3 {
    s: Compose2;
}

contract NestedCompose {
    field: Compose3;

    init() {
        self.field = Compose3{
            s: Compose2{
                s: Compose1{
                    num: 7,
                },
            },
        };
    }
}