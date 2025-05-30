struct Str1 {
    s: String;
}

struct Str2 {
    s1: Str1;
    s2: Str1;
    s3: Str1;
}

struct Str3 {
    nested: Str2;
    another: String;
}

contract StrNest {
    val: Str3;

    init() {
        self.val = Str3{
            nested: Str2{
                s1: Str1{s: "one"},
                s2: Str1{s: "two"},
                s3: Str1{s: "three"}
            },
            another: "four"
        };
    }
}