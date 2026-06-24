// Contract with many optional fields in a nested struct, which itself is in another struct
struct InnerMost {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct Wrapper {
    inner: InnerMost;
    flag: Bool;
}

contract NestedManyOptional {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: InnerMost{ a: null, b: null, c: null },
            flag: true
        };
    }
}