struct Mixed {
    intVal: Int as uint64;
    flag: Bool;
    label: String;
    maybeOwner: Address?;
}

contract MixedFields {
    m: Mixed;

    init() {
        self.m = Mixed{
            intVal: 123456,
            flag: true,
            label: "Test",
            maybeOwner: null
        };
    }
}