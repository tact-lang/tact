struct InnerOptStruct {
    s: String?;
    b: Bool?;
}

contract InnerOptTest {
    x: InnerOptStruct;

    init() {
        self.x = InnerOptStruct{
            s: "sss",
            b: null,
        };
    }
}