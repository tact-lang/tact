struct MultiType {
    a: Int;
    b: Bool;
    c: String;
    d: String?;
    e: Bool?;
    f: Int?;
}

contract Test41 {
    val: MultiType;

    init() {
        self.val = MultiType{
            a:1,
            b:true,
            c:"yes",
            d:null,
            e:null,
            f:null
        };
    }
}
