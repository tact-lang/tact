struct OptStruct {
    v1: Int;
    v2: Int?;
}

contract OptionalStructTest {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            v1: 1,
            v2: null
        };
    }
}