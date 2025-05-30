struct Params {
    valueInt: Int;
    valueBool: Bool;
    valueString: String;
}

contract StoragePartialDefaultTest {
    data: Params;

    init() {
        self.data = Params{
            valueInt: 5,
            valueBool: true,
            valueString: "",
        };
    }
}