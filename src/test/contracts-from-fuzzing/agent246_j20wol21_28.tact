struct DataLevel1 {
    info: String;
    deep: DataLevel2;
}
struct DataLevel2 {
    flag: Bool;
    number: Int;
    deep: DataLevel3;
}
struct DataLevel3 {
    text: String?;
    valid: Bool?;
}
contract VeryDeep {
    base: DataLevel1;

    init() {
        self.base = DataLevel1{
            info: "start",
            deep: DataLevel2{
                flag: true,
                number: 10,
                deep: DataLevel3{
                    text: "deepest",
                    valid: null,
                }
            }
        };
    }
}
