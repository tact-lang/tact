struct OptSequence {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract SeqOptContract {
    s: OptSequence;
    init(){
        self.s = OptSequence{a:null,b:2,c:null,d:4,e:5};
    }
}