struct DeepNested {
    inner1: Inner1;
    val: Int;
}

struct Inner1 {
    inner2: Inner2;
    flag: Bool;
}

struct Inner2 {
    str: String;
    optVal: Int?;
}

contract DeepNestTest {
    s: DeepNested;
    
    init() {
        self.s = DeepNested{
            inner1: Inner1{
                inner2: Inner2{
                    str: "abc",
                    optVal: null,
                },
                flag: true,
            },
            val: 0,
        };
    }
}