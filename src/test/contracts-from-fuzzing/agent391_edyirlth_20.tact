struct OptionalBoolInt {
    flag: Bool?;
    num: Int?;
}

struct OptionalString {
    str: String?;
}

contract SplitOptionals {
    ob: OptionalBoolInt;
    os: OptionalString;
    init() {
        self.ob = OptionalBoolInt{flag:true,num:null};
        self.os = OptionalString{str:null};
    }
}