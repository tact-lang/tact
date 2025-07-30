struct LoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooongName {
    one: Int;
    two: Bool;
    three: String;
    four: Int?;
}

contract TestContract {
    field_with_a_very_looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong_name: LoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooongName = LoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooongName{
        one: 1,
        two: false,
        three: "hi",
        four: null
    };

    init() {
        self.field_with_a_very_looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong_name = LoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooongName{
            one: 2,
            two: true,
            three: "bye",
            four: 42
        };
    }

    receive() {
        dump(self.field_with_a_very_looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong_name.one);
    }
}