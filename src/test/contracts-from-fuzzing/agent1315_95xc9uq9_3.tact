struct ManyOptionals {
    x: Int?;
    y: Int?;
    z: Int?;
    s: String?;
    addr: Address?;
}

contract OptionalFields {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            x: 1,
            y: null,
            z: null,
            s: null,
            addr: null
        };
    }
}