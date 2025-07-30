struct Complex {
    id: Int;
    name: String;
    optionalFlag: Bool?;
}

contract OptionalRootTest {
    rootField: Complex?;

    init() {
        self.rootField = null;
    }
}