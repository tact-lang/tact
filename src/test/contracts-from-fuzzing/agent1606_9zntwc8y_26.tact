struct Variety {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
}

contract VariousFields {
    vals: Variety;

    init() {
        self.vals = Variety{
            a:0,b:null,c:"x",d:null,e:true,f:null
        };
    }

    receive() {
        let v = self.vals;
    }
}