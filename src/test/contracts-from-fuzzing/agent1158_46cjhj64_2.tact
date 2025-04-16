struct DataLvl2 {
    flag: Bool;
    amount: Int;
}

struct DataLvl1 {
    inner: DataLvl2;
    description: String;
}

contract NestedStructContract {
    storage: DataLvl1;

    init() {
        self.storage = DataLvl1{
            inner: DataLvl2{flag: false, amount: 100},
            description: "test"
        };
    }
}
