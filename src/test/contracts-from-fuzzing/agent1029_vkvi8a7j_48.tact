struct NestedDefaultsOptionals {
    a: Int = 7;
    inner: InnerOpt;
}

struct InnerOpt {
    b: Int? = null;
    c: Bool? = null;
}

contract NestedDefOptContract {
    data: NestedDefaultsOptionals;
    init() {
        self.data = NestedDefaultsOptionals{
            inner: InnerOpt{}
        };
    }
}