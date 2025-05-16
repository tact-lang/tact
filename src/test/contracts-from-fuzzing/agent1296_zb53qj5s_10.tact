struct StringAndBool {
    text: String;
    flag: Bool;
}

struct Combine {
    s1: StringAndBool;
    s2: StringAndBool;
}

contract VariousTypes {
    content: Combine;
    init() {
        self.content = Combine{
            s1: StringAndBool{text:"abc",flag:true},
            s2: StringAndBool{text:"def",flag:false}
        };
    }
}