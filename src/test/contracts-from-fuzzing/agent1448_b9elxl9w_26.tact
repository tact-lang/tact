struct StructWithStr {
    a: String;
    b: String?;
}

contract StringTest {
    field: StructWithStr;

    init() {
        self.field = StructWithStr{
            a: "hello",
            b: null
        };
    }
}