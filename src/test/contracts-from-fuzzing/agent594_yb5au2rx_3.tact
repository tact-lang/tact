struct InnerMost {
    val: Int?;
}

struct Middle {
    inner: InnerMost;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    text: String;
}

contract DeepNestedContract {
    holder: Outer = Outer{
        mid: Middle{
            inner: InnerMost{ val: null },
            flag: true
        },
        text: "hello"
    };
}