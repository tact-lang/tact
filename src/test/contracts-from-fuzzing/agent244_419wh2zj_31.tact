// Large nested struct with default values and optionals at various depths
struct Sub {
    a: Int = 1;
    b: Bool = true;
    c: String?;
}

struct Container {
    sub1: Sub;
    sub2: Sub?;
    note: String = "zzz";
}

contract LargeDefaultsNested {
    data: Container;

    init() {
        self.data = Container{
            sub1: Sub{},
            sub2: null,
            note: "ok"
        };
    }
}