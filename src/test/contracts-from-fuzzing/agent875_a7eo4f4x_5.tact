struct InnerOptionalStruct {
    val: Int;
    opt: Bool?;
}

struct WrapperOptStruct {
    field: InnerOptionalStruct?;
}

contract WrapperOptTest {
    data: WrapperOptStruct;

    init() {
        self.data = WrapperOptStruct{
            field: InnerOptionalStruct{
                val: 77,
                opt: null
            }
        };
    }
}