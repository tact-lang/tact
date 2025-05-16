struct BoolAndString {
    flag: Bool;
    text: String;
    optInt: Int?;
}

contract DiffTypes {
    s: BoolAndString;
    init(){
        self.s = BoolAndString{
            flag: true,
            text: "test",
            optInt: null,
        };
    }
}