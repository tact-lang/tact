struct Info {
    note: String = "This is a very long default string that is meant to test edge cases of string serialization inside structs when stored inside persistent contract state.";
}

contract LongStringDefaults {
    data: Info;

    init() {
        self.data = Info{};
    }
}