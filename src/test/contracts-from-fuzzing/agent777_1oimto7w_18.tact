struct MixedNullable {
    status: Bool?;
    count: Int?;
    label: String?;
    ready: Bool;
    note: String;
}

contract MixedNullableContract {
    data: MixedNullable;

    init() {
        self.data = MixedNullable{
            status: null,
            count: 5,
            label: null,
            ready: true,
            note: "done",
        };
    }
}