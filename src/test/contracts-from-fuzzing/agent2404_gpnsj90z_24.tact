// Contract with multiple optional nested structs fields

struct NestedOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    foo: Int;
    bar: NestedOpt?;
    s: String?;
}

contract TestContract {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            foo: 5,
            bar: null,
            s: "x"
        };
    }
}