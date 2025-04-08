// nested structs with some fields defaulted, some optionals
struct Inner {
    flag: Bool = false;
    name: String = "none";
    count: Int?;
}

struct Outer {
    id: Int;
    inner: Inner;
    note: String?;
}

contract DefaultsMix {
    data: Outer;

    init() {
        self.data = Outer{
            id: 7,
            inner: Inner{
                count: null,
            },
            note: null,
        };
    }
}