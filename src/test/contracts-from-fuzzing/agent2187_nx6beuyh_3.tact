struct OptionalNested { x: Int?; y: Int; }

contract OptionalTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ x: null, y: 10 };
    }
}