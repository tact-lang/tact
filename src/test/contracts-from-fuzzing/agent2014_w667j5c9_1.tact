struct DeepNest1 { val: Int }
struct DeepNest2 { nest1: DeepNest1 }
struct DeepNest3 { nest2: DeepNest2 }
struct DeepNest4 { nest3: DeepNest3 }

contract DeepStorage {
    nest: DeepNest4;

    init() {
        self.nest = DeepNest4{
            nest3: DeepNest3{
                nest2: DeepNest2{
                    nest1: DeepNest1{ val: 123 }
                }
            }
        };
    }
}