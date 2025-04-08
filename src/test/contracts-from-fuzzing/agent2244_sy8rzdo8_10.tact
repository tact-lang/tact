struct VeryNested {
    a: Nest1;
}
struct Nest1 {
    b: Nest2;
}
struct Nest2 {
    c: Nest3;
}
struct Nest3 {
    d: Nest4;
}
struct Nest4 {
    e: Int;
    f: Bool;
    g: String;
    h: Int?;
    i: Bool?;
    j: String?;
}

contract DeepOpts {
    field: VeryNested;

    init() {
        self.field = VeryNested{
            a: Nest1{
                b: Nest2{
                    c: Nest3{
                        d: Nest4{
                            e: 1,
                            f: true,
                            g: "X",
                            h: null,
                            i: null,
                            j: null
                        }
                    }
                }
            }
        };
    }
}
