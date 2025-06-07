struct OptionalNest {
    innerOpt: Int?;
    innerOptBool: Bool?;
    innerOptString: String?;
}

struct Container {
    nestedOpt: OptionalNest?;
}

contract OptionalStructInStructOptTest {
    field: Container = Container{};

    receive() {
        let _ = self.field.nestedOpt;
    }
}