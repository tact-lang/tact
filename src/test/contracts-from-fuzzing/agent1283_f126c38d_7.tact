struct Str1 {
    a: Int;
}

struct Str2 {
    inner: Str1;
    b: Bool;
}

struct Str3 {
    nested: Str2;
    s: String;
}

contract DeepChain {
    data: Str3;

    init() {
        self.data = Str3{
            nested: Str2{
                inner: Str1{ a: 10 },
                b: true
            },
            s: "hello"
        };
    }
}