struct Sub {
    innerVal: Int?;
    flag: Bool = false;
}
struct Data {
    field1: Sub;
    field2: Sub;
    text: String?;
}

contract TestContract {
    data: Data;

    init() {
        self.data = Data{
            field1: Sub{ innerVal: null, flag: true },
            field2: Sub{ innerVal: 42, flag: false },
            text: null
        };
    }
}