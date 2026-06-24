struct P1 { f:Int; }
contract FlatBasic {
    p1:P1;
    init(){ self.p1 = P1{f:42}; }
}