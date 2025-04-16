struct OptNested {
    a: Int?;
    b: String?;
}

contract WithOptionals {
    data: OptNested;

    init() {
        self.data = OptNested{
            a: null,
            b: "test"
        };
    }
}