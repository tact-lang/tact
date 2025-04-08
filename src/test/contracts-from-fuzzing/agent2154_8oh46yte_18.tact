struct S0 {a:Int;}

struct S1 {nested:S0;}

struct S2 {nested:S1;}

struct S3 {nested:S2;}

struct S4 {nested:S3;}

contract Nest5 {
    deep: S4;

    init() {
        self.deep = S4{nested:S3{nested:S2{nested:S1{nested:S0{a:1}}}}};
    }
}