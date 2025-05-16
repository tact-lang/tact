struct IntStringBool {
    number: Int;
    word: String;
    flag: Bool;
}

struct Container {
    s1: IntStringBool;
    s2: IntStringBool;
}

contract TwoStructs {
    field: Container;

    init() {
        self.field = Container{
            s1: IntStringBool{number:1,word:"a",flag:true},
            s2: IntStringBool{number:2,word:"b",flag:false}
        };
    }
}