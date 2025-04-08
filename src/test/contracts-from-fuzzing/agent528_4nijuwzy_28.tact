struct Inside1 { a: Int; b: Int?; }
struct Inside2 { c: Bool; d: String?; e: Inside1; }
struct Inside3 { f: Int; g: Inside2; h: Bool?; }
struct Inside4 { i: String; j: Inside3; }

contract BigPersistentFields {
    a: Int;
    b: Bool?;
    c: String;
    d: Inside4;
    e: Inside3?;
    f: Inside2;
    g: Inside1?;

    init() {
        self.a = 42;
        self.b = true;
        self.c = "hello";
        self.d = Inside4{
            i: "deep",
            j: Inside3{
                f:7,
                g: Inside2{
                    c: false,
                    d: null,
                    e: Inside1{ a: 1, b: null }
                },
                h: null
            }
        };
        self.e = null;
        self.f = Inside2{
            c:true,
            d:"world",
            e:Inside1{a:2,b:3}
        };
        self.g = null;
    }
}
