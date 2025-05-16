struct Compose1 {
    a: Int;
    b: Bool;
}

struct Compose2 {
    c: String;
    d: Compose1;
}

struct Compose3 {
    e: Compose2;
    f: Bool?;
}

contract NestedCombination {
    complex: Compose3;

    init() {
        self.complex = Compose3{
            e: Compose2{
                c: "hi",
                d: Compose1{a:1,b:true}
            },
            f: null,
        };
    }
}
