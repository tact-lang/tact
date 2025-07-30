struct Str1 { a: Int; }
struct Str2 { b: Bool; }
struct Str3 { c: String; }

struct Combo {
    s1: Str1;
    s2: Str2;
    s3: Str3;
}

contract NestedMultiple {
    val: Combo;
    init() {
        self.val = Combo{
            s1: Str1{ a: 1 },
            s2: Str2{ b: false },
            s3: Str3{ c: "hi" }
        };
    }
}