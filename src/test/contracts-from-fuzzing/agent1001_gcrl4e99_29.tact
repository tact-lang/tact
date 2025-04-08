struct Compose {
    a: Int;
    b: Bool;
    c: String;
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract AllNullable {
    f: Compose;

    init() {
        self.f = Compose{
            a:1, b:true, c:"x", o1:null, o2:true, o3:null
        };
    }
}