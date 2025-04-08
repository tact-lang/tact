struct Agg {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
    e: Int;
}

contract AggContract {
    ag: Agg;

    init() {
        self.ag = Agg{
            a:1,b:null,c:3,d:null,e:5
        };
    }
}