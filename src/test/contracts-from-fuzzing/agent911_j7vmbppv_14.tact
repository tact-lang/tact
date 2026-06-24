struct NestedDefaultOptional {
    val: Int? = null;
    msg: String = "default";
}

contract DefaultOptTest {
    data: NestedDefaultOptional;

    init() {
        self.data = NestedDefaultOptional{};
    }
}