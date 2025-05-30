struct BigNested1 {
    a: Int;
    b: String;
    c: Bool;
    d: String?;
}

struct BigNested2 {
    e: BigNested1;
    f: Int?;
    g: Bool;
}

struct BigNested3 {
    h: BigNested2;
    i: String;
    j: Bool?;
}

contract LargeNested {
    data: BigNested3;

    init() {
        self.data = BigNested3{
            h: BigNested2{
                e: BigNested1{a:1,b:"a",c:true,d:null},
                f: null,
                g: true
            },
            i: "hi",
            j: null
        };
    }
}
