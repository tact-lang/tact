struct InnerLevel3 { z: Int }
struct InnerLevel2 { y: InnerLevel3 }
struct InnerLevel1 { x: InnerLevel2 }

contract TestContract {
    nested: InnerLevel1;

    init() {
        self.nested = InnerLevel1{
            x: InnerLevel2{
                y: InnerLevel3{z: 42}
            }
        };
    }
}