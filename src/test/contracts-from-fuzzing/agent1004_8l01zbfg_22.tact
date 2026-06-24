// struct with nested struct with blend of bool, int, string optionals
struct Blend {
    a: Bool?;
    b: Int?;
    c: String?;
}

struct Wrapper {
    inner: Blend;
    flag: Bool;
}

contract TestContract {
    field: Wrapper;
    init() {
        self.field = Wrapper{
            inner: Blend{
                a: null,
                b: 100,
                c: null
            },
            flag: true
        };
    }
}