struct NestedPoint {
    x: Int;
    y: Int;
}

struct FancyParams {
    label: String;
    point: NestedPoint;
    optionalAge: Int?;
    flag: Bool;
}

contract StorageTest {
    params: FancyParams;

    init() {
        self.params = FancyParams{
            label: "test",
            point: NestedPoint{ x: 1, y: 2 },
            optionalAge: null,
            flag: true,
        };
    }
}
