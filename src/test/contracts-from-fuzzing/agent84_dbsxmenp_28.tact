struct SS1 { val: Int; }
struct SS2 { s1: SS1; }
struct SS3 { s2: SS2; }

contract TopContract {
    s: SS3;
    init() {
        self.s = SS3{
            s2: SS2{
                s1: SS1{ val: 777 }
            }
        };
    }
}
