struct NestedWithOptionals {
    a: Int?;
    s: InnerWithOpt?;
}

struct InnerWithOpt {
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: NestedWithOptionals;

    init() {
        self.data = NestedWithOptionals{
            a: null,
            s: null
        };
    }
}