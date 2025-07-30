contract TestContract {
    big: Big;
    
    init() {
        self.big = Big{
            a: "str1",
            b: "str2",
            c: "str3",
            d: "str4",
            e: "str5",
            f: "str6",
            g: "str7",
            h: "str8",
            i: "str9",
            j: "str10",
        };
    }
}

struct Big {
    a: String; b: String; c: String; d: String; e: String;
    f: String; g: String; h: String; i: String; j: String;
}