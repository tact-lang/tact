struct MultiLayer {
    a: Int;
    b: Bool?;
    c: Nested1;
}

struct Nested1 {
    s: String;
    inner: Nested2?;
}

struct Nested2 {
    val: Int;
    flag: Bool;
}

contract TestMultiLayer {
    m: MultiLayer;

    init() {
        self.m = MultiLayer{
            a: 42,
            b: null,
            c: Nested1{
                s: "hi",
                inner: Nested2{val:1,flag:true}
            }
        };
    }
}