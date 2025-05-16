struct Low1 { f: Int; }
struct Low2 { g: Low1; }
struct Low3 { h: Low2; }
struct Low4 { i: Low3; }
struct Low5 { j: Low4; }
struct Low6 { k: Low5; }

contract Nest6 {
    big: Low6;

    init() {
        self.big = Low6{
            k: Low5{
                j: Low4{
                    i: Low3{
                        h: Low2{
                            g: Low1{f:42}
                        }
                    }
                }
            }
        };
    }
}