struct Data {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract TestContract {
    data: Data;

    init() {
        self.data = Data{
            i: null,
            b: null,
            s: null
        };
    }
}