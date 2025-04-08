struct BigNested {
    str: String;
    inner: Struct1;
}

struct Struct1 {
    flag: Bool;
    val: Int;
    inner2: Struct2;
}

struct Struct2 {
    s: String?;
    b: Bool?;
    num: Int?;
}

contract VeryNestedTest {
    data: BigNested;
    init() {
        self.data = BigNested{
            str: "hi",
            inner: Struct1{
                flag: false,
                val: 0,
                inner2: Struct2{
                    s: null,
                    b: null,
                    num: null,
                }
            }
        };
    }
}
