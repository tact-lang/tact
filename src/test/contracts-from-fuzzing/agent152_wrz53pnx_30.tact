struct NestedDefaultOptionals {
    a: Int? = null;
}

struct OuterDefaultsOpt {
    n: NestedDefaultOptionals? = null;
}

contract NestedDefaultsOptTest {
    data: OuterDefaultsOpt;

    init() {
        self.data = OuterDefaultsOpt{};
    }
}
