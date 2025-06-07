struct Data {
    number: Int;
    flag: Bool;
    text: String;
    optNumber: Int?;
    optString: String?;
}

contract TestContract {
    item: Data;

    init() {
        self.item = Data{
            number: 0,
            flag: false,
            text: "",
            optNumber: null,
            optString: null
        };
    }
}