struct StrStruct { s: String; }
contract OptionalField {
    f: StrStruct?;
    init() {
        self.f = null;
    }
}