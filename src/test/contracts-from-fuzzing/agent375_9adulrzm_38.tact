// Deep nested with multiple types and optionals
struct Bottom {
    a: Int;
    b: Bool;
}

struct Middle {
    mi: Int?;
    mb: Bottom?;
}

struct Top {
    t1: Bool;
    t2: Middle?;
    t3: String;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            t1:true,
            t2: Middle{mi:null, mb: Bottom{a:9,b:false}},
            t3: "string"
        };
    }
}
