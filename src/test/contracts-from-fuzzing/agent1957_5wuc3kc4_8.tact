struct Str1 {
    a: Int;
}

struct Str2 {
    a: Int;
    s: Str1;
}

struct Str3 {
    a: Int;
    s: Str2;
}

contract NestedChain {
    chain: Str3;

    init() {
        self.chain = Str3{ a: 1, s: Str2{ a: 2, s: Str1{a:3} } };
    }
}