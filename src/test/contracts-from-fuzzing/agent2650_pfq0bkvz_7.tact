struct Optionals {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract StorageTest {
    data: Optionals;

    init() {
        self.data = Optionals{
            optInt: null,
            optBool: true,
            optStr: null
        };
    }
}