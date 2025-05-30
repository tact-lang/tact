struct N1 {a:Int;}
struct N2 {n: N1;}
struct N3 {n: N2;}
struct N4 {n: N3;}
struct N5 {n: N4;}

contract SuperChain {
    d: N5;

    init() {
        self.d = N5{
            n: N4{n: N3{n: N2{n:N1{a:0}}}}
        };
    }
}