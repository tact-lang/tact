struct LargeOptional {
    op1: Int?;
    op2: Bool?;
    op3: String?;
    op4: Int?;
    op5: Bool?;
    op6: String?;
    op7: Int?;
    op8: Bool?;
    op9: String?;
}

contract OptionalFieldsHolder {
    data: LargeOptional;

    init() {
        self.data = LargeOptional{
            op1: null,
            op2: null,
            op3: null,
            op4: null,
            op5: null,
            op6: null,
            op7: null,
            op8: null,
            op9: null,
        };
    }
}