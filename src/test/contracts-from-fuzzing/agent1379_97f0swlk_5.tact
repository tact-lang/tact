struct T1 { f: Int }
struct T2 { t1: T1 }
struct T3 { t2: T2 }
struct T4 { t3: T3 }
struct T5 { t4: T4 }

contract DeepChain {
    data: T5;

    init() {
        self.data = T5{
            t4: T4{
                t3: T3{
                    t2: T2{
                        t1: T1{
                            f: 10
                        }
                    }
                }
            }
        };
    }
}
