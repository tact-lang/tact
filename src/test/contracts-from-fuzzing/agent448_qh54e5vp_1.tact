struct Nested {
    value: Int;
    next: Inner?;
}

struct Inner {
    flag: Bool;
    data: DataStruct;
}

struct DataStruct {
    num: Int;
    text: String;
}

contract TestContract {
    storageField: Nested;
    
    init() {
        self.storageField = Nested{
            value: 1,
            next: Inner{
                flag: true,
                data: DataStruct{ num: 42, text: "hello" }
            }
        };
    }
}