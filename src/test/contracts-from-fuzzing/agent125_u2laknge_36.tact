// very deep nested structs, 5 levels
struct L1 {val: Int;}
struct L2 {next: L1;}
struct L3 {next: L2;}
struct L4 {next: L3;}
struct L5 {next: L4;}

contract VeryDeep {
    data: L5;

    init() {
        self.data = L5{
            next:L4{
                next:L3{
                    next:L2{
                        next:L1{val:42}
                    }
                }
            }
        };
    }
}