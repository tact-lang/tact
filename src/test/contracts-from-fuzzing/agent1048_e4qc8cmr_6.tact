struct DataOne {
    val: Int as int64;
}

struct DataTwo {
    flag: Bool;
    s: String;
    optInt: Int?;
}

contract TestContract {
    first: DataOne;
    second: DataTwo;

    init() {
        self.first = DataOne{val: -99};
        self.second = DataTwo{
            flag: true,
            s: "data",
            optInt: null
        };
    }
}