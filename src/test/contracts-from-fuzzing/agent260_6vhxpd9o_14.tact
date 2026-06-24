struct InnerSerOpt {
    foo: Int? as uint32;
}

struct OuterSerOpt {
    nested: InnerSerOpt;
}

contract SerOptNested {
    data: OuterSerOpt;

    init() {
        self.data = OuterSerOpt{ nested: InnerSerOpt{ foo: null } };
    }
}