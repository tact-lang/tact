struct OptionalFields {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract WithOptionals {
    data: OptionalFields = OptionalFields{a: null, b: null, s: null};

    receive() {
        let _ = self.data;
    }
}