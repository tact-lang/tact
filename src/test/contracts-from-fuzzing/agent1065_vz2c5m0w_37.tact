struct NestedDefaultsOpt {
    x: Int = 1;
    y: Int?;
}

contract NestedDefaultsOptTest {
    stuff: NestedDefaultsOpt;

    init() {
        self.stuff = NestedDefaultsOpt{};
    }
}
