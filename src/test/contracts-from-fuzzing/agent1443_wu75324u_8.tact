struct NestedOptRef {
    id: Int;
    child: Child?;
}

struct Child {
    name: String;
    active: Bool;
    extra: Extra?;
}

struct Extra {
    comment: String?;
    flag: Bool;
}

contract ComplexOptionals {
    data: NestedOptRef;

    init() {
        self.data = NestedOptRef{
            id: 1,
            child: null,
        };
    }
}