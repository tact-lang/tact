struct MultiOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract MultiOptTest {
    data: MultiOptionals;

    init() {
        self.data = MultiOptionals{
            a: null,
            b: null,
            c: null
        };
    }
}