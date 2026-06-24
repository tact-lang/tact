struct Deep3 {
    val: Int;
}

struct Deep2 {
    c: Deep3;
    optionalVal: Int?;
}

struct Deep1 {
    b: Deep2;
    str: String;
}

contract DeepNestedStructsTest {
    nested: Deep1;
    init() {
        self.nested = Deep1{
            b: Deep2{c: Deep3{val: 5}, optionalVal: null},
            str: "hello"
        };
    }
}