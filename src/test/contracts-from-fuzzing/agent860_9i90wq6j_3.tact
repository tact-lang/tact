struct Sample {
    a: Int;
    b: Bool?;
    c: String?;
}

contract TestContract {
    field1: Sample;

    init() {
        self.field1 = Sample{
            a: 123,
            b: null,
            c: null
        };
    }
}