struct Deep1 { a:Int; }
struct Deep2 { d1:Deep1; }
struct Deep3 { d2:Deep2; }
struct Deep4 { d3:Deep3; }
struct Deep5 { d4:Deep4; }
struct Deep6 { d5:Deep5; }

contract TestContract {
    nest:Deep6;

    init() {
        self.nest = Deep6{
            d5: Deep5{
                d4: Deep4{
                    d3: Deep3{
                        d2: Deep2{
                            d1: Deep1{ a:77 }
                        }
                    }
                }
            }
        };
    }
}