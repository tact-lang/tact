struct MultipleOptionals {
    one: Int?;
    two: Bool?;
    three: String?;
    four: Int?;
    five: Bool?;
}

contract MultiOptionalContract {
    m: MultipleOptionals = MultipleOptionals{
        one: null, two: true, three: null, four: 99, five: null
    };

    receive() {
        let _ = self.m.four;
    }
}