struct OptionalComposite {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract CompositeOptionalTest {
    comp: OptionalComposite?;

    init() {
        self.comp = null;
    }
}