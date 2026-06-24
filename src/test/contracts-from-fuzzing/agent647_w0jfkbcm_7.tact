struct OptionalFields {
    x: Int?;
    y: String?;
    z: Cell?;
    q: Slice?;
    r: Builder?;
    s: Bool?;
    t: Address?;
}

contract TestContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            x: null,
            y: null,
            z: null,
            q: null,
            r: null,
            s: null,
            t: null
        };
    }
}