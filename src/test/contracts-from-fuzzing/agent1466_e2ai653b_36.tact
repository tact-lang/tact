struct OptBoolPending {
    a: Bool?;
    b: Bool?;
}

contract BoolOptTest {
    data: OptBoolPending = OptBoolPending{ a: null, b: null };

    init() {
        self.data = OptBoolPending{ a: true, b: false };
    }
}
