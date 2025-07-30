struct Compose1 {
    a: Int;
}
struct Compose2 {
    b: Compose1;
}
struct Compose3 {
    c: Compose2;
}
struct Compose4 {
    d: Compose3;
}
struct Compose5 {
    e: Compose4;
}
struct Compose6 {
    f: Compose5;
}

contract DifferentNestings {
    nested: Compose6;

    init() {
        self.nested = Compose6{
            f: Compose5{
                e: Compose4{
                    d: Compose3{
                        c: Compose2{
                            b: Compose1{
                                a: 99,
                            },
                        },
                    },
                },
            },
        };
    }
}
