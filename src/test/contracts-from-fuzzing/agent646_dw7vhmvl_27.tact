struct EdgeCaseStruct {
    a: Int;
    b: Bool?;
    c: Int;
    d: Bool?;
}

contract AlternatingOptTest {
    data: EdgeCaseStruct;

    init() {
        self.data = EdgeCaseStruct{
            a: 1,
            b: null,
            c: 2,
            d: null
        };
    }
}