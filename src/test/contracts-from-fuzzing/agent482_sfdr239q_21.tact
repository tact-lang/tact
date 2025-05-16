struct User {
    id: Int;
    name: String;
}

contract ParamsMix(
    foo: Int as uint32,
    bar: Bool,
    who: User,
    optionalInt: Int?,
    note: String?
) {
    receive() {
        // dummy to force compilation
        let _ = self.foo + 1;
    }
}
