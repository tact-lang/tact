struct OptionalNested { foo: Int?; bar: Bool?; }
contract Test {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ foo: null, bar: true };
    }
}