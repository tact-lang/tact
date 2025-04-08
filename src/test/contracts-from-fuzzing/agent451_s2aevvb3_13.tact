struct Info {
    id: Int;
    label: String?;
}

contract TwoStructs {
    first: Info;
    second: Info;

    init() {
        self.first = Info{ id: 1, label: null };
        self.second = Info{ id: 2, label: "hey" };
    }
}