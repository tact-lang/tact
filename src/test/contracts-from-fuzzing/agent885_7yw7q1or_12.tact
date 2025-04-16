// struct with many optional and nested optional fields (not nested optionals themselves)
struct MultiOpt {
    foo: Int?;
    bar: String?;
    nested: NestedOpt?;
}

struct NestedOpt {
    inner: String?;
    flag: Bool?;
}

contract MultiOptional {
    data: MultiOpt;

    init() {
        self.data = MultiOpt {
            foo: null,
            bar: null,
            nested: NestedOpt {
                inner: null,
                flag: true
            }
        };
    }
}
