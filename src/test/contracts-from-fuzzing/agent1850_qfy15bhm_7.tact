struct Str1 {
    a: Int;
}

struct Str2 {
    b: Str1;
}

struct Str3 {
    c: Str2;
}

struct Str4 {
    d: Str3;
}

struct Str5 {
    e: Str4;
}

contract TestContract {
    nested: Str5;

    init() {
        self.nested = Str5{
            e: Str4{
                d: Str3{
                    c: Str2{
                        b: Str1{
                            a: 777,
                        },
                    },
                },
            },
        };
    }
}
