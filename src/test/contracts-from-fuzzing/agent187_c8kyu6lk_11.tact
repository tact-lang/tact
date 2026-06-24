struct OptStruct {
    foo: Int?;
    bar: Bool?;
}

contract StorageNullDefaultsTest {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            foo: null,
            bar: null,
        };
    }
}