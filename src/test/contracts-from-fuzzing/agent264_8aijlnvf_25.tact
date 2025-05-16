struct Data {
    id: Int;
    desc: String;
    active: Bool?;
}

contract AllFieldTypes {
    data: Data;

    init() {
        self.data = Data{
            id: 5,
            desc: "hi",
            active: null,
        };
    }
}