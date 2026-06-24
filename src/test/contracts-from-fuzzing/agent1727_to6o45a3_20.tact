// struct with long optional-only field list
struct ManyOpts {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
}

contract OptsHeavy {
    value: ManyOpts = ManyOpts{};

    receive() {
        self.value = ManyOpts{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "abc",
            f: null,
        };
    }
}