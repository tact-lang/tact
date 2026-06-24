struct MultiNest1 { val: Int; }
struct MultiNest2 { mn1: MultiNest1; }
struct MultiNest3 { mn2: MultiNest2; }
struct MultiNest4 { mn3: MultiNest3; }
struct MultiNest5 { mn4: MultiNest4; }

contract MultiDepthFiveContract {
    storage: MultiNest5;
    init() {
        self.storage = MultiNest5{
            mn4: MultiNest4{
                mn3: MultiNest3{
                    mn2: MultiNest2{
                        mn1: MultiNest1{ val: 7 }
                    }
                }
            }
        };
    }
}