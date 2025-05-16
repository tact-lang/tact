struct A1 { f1: Int }
struct A2 { f2: A1 }
struct A3 { f3: A2 }
struct A4 { f4: A3 }
struct A5 { f5: A4 }
contract DeepFive {
    x: A5;
    init() {
        self.x = A5{
            f5: A4{
                f4: A3{
                    f3: A2{
                        f2: A1{
                            f1: 999
                        }
                    }
                }
            }
        };
    }
}