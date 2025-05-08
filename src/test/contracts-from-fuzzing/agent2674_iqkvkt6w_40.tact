// very large nested struct
struct Sub1 {
    a: Int;
    b: Bool;
    c: String;
}

struct Sub2 {
    s1: Sub1;
    s2: Sub1;
    s3: Sub1;
}

struct BigNest {
    s2A: Sub2;
    s2B: Sub2;
    s2C: Sub2;
}

contract BigNestedStructTest {
    store: BigNest;

    init() {
        self.store = BigNest{
            s2A: Sub2{
                s1: Sub1{ a:1,b:true,c:"a" },
                s2: Sub1{ a:2,b:false,c:"b" },
                s3: Sub1{ a:3,b:true,c:"c" },
            },
            s2B: Sub2{
                s1: Sub1{ a:4,b:false,c:"d" },
                s2: Sub1{ a:5,b:true,c:"e" },
                s3: Sub1{ a:6,b:false,c:"f" },
            },
            s2C: Sub2{
                s1: Sub1{ a:7,b:true,c:"g" },
                s2: Sub1{ a:8,b:false,c:"h" },
                s3: Sub1{ a:9,b:true,c:"i" },
            },
        };
    }
}