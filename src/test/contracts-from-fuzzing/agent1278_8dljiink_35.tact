struct Info {
    count: Int?;
}

message(2024) Carry {
    label: String;
    data: Info?;
}

contract TestContract {
    maybe: Carry?;

    init() {
        self.maybe = null;
    }
}