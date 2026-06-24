struct HasManyNestedStructs {
    first: Int;
    secStruct: IntStringBool;
    third: NestedOptional;
}

struct NestedOptional {
    f: Int?;
}

struct IntStringBool {
    i: Int;
    s: String;
    b: Bool;
}

contract TestContract {
    data: HasManyNestedStructs;

    init() {
        self.data = HasManyNestedStructs{
            first: 1,
            secStruct: IntStringBool{i:2,s:"s",b:true},
            third: NestedOptional{f:null}
        };
    }
}