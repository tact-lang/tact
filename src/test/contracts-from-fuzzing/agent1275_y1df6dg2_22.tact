struct NestedDefaultsOptional {
    val: Int? = null;
    flag: Bool = false;
}

contract NestedDefaultsOptTest {
    data: NestedDefaultsOptional;

    init() {
        self.data = NestedDefaultsOptional{};
    }
}