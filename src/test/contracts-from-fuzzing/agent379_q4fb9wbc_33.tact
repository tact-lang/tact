struct OptionalString {
    s: String?;
}

contract OptionalStringStruct {
    f: OptionalString;

    init() {
        self.f = OptionalString{ s:null };
    }
}