struct OmitMiddleFields {
    a: Int;
    b: Int;
    c: Int;
}

contract OmitMiddleTest {
    data: OmitMiddleFields;

    init() {
        self.data = OmitMiddleFields{
            a:1,
            c:3,
            b:2
        };
    }
}
