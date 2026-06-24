struct MultiLevelOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Holder {
    m: MultiLevelOptionals?;
    s: String;
}

contract MultiLevelOptionalContract {
    data: Holder;

    init() {
        self.data = Holder{
            m: null,
            s: "hi"
        };
    }
}