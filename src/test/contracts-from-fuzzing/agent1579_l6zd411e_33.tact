struct Nester1 {x: Int;}
struct Nester2 {y: Bool;}
struct OuterJoin {
    n1: Nester1;
    n2: Nester2;
    flag: Bool;
}
contract MixedNest {
    o: OuterJoin;
    init() {
        self.o = OuterJoin{
            n1: Nester1{x:1},
            n2: Nester2{y:true},
            flag: false
        };
    }
    receive() {
        self.o.n2.y = false;
    }
}