struct Params {
    x: Int;
    y: Int?;
    z: Bool;
}

contract StorageTest {
    params: Params;
    init() {
        self.params = Params{
            x: 1,
            y: null,
            z: true,
        };
    }
}