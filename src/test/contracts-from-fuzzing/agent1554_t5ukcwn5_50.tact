struct SingleOptional { x: Int?; }
contract SingleOptionalField {
    s: SingleOptional;

    init() {
        self.s = SingleOptional{ x: null };
    }
}