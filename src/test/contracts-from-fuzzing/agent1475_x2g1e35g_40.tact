// Edge case: deep many bool chain
struct B5 { f: Bool; }
struct B4 { f: B5; }
struct B3 { f: B4; }
struct B2 { f: B3; }
struct B1 { f: B2; }

contract BoolDeep {
    x: B1;

    init() {
        self.x = B1{
            f: B2{
                f: B3{
                    f: B4{
                        f: B5{
                            f: true
                        }
                    }
                }
            }
        };
    }
}