struct ManyOptionals {
    one: Int?;
    two: Bool?;
    three: Address?;
    four: String?;
}

contract OptionalFields {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{
            one: null,
            two: true,
            three: null,
            four: "hello"
        };
    }
}