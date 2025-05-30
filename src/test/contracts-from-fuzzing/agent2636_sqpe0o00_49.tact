struct NegativeSerializer {
    a: Int as int8;
    b: Int as int16;
}

contract NegSerTest {
    data: NegativeSerializer;

    init() {
        self.data = NegativeSerializer{
            a: -10,
            b: -20,
        };
    }
}