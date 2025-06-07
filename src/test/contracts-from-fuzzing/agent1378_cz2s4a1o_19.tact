struct OptionalString {
    s: String?;
}
contract OptField {
    f: OptionalString = OptionalString{s:null};
    init() {
        self.f = OptionalString{s:"hi"};
    }
    receive() {}
}