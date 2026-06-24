struct Compose1 {
    num: Int;
}

struct Compose2 {
    opt: Compose1?;
}

struct Compose3 {
    nested: Compose2;
    flag: Bool;
}

contract TestContract {
    c3: Compose3;

    init() {
        self.c3 = Compose3 {
            nested: Compose2 {
                opt: null,
            },
            flag: true,
        };
    }
}