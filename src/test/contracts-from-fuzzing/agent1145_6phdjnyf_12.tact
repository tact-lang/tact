struct ComposeNested {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    flag: Bool;
    nested: Nested;
}

struct Nested {
    number: Int;
    text: String;
    optionalBool: Bool?;
}

contract ComposeNestedTest {
    data: ComposeNested;

    init() {
        self.data = ComposeNested{
            inner1: Inner{
                flag: true,
                nested: Nested{number:1,text:"one",optionalBool:null}
            },
            inner2: Inner{
                flag: false,
                nested: Nested{number:2,text:"two",optionalBool:true}
            }
        };
    }
}
