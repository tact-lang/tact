struct VeryDeep1 {x: Int;}
struct VeryDeep2 {x: VeryDeep1;}
struct VeryDeep3 {x: VeryDeep2;}
struct VeryDeep4 {x: VeryDeep3;}
struct VeryDeep5 {x: VeryDeep4;}

contract Test {
    v: VeryDeep5;

    init() {
        self.v = VeryDeep5{
            x: VeryDeep4{
                x: VeryDeep3{
                    x: VeryDeep2{
                        x: VeryDeep1{ x: 42 }
                    }
                }
            }
        };
    }
}