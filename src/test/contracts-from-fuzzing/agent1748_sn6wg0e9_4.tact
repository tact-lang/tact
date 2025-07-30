struct DeepNestLevel3 { val: Int }
struct DeepNestLevel2 { next: DeepNestLevel3 }
struct DeepNestLevel1 { inner: DeepNestLevel2 }

contract TestContract {
    data: DeepNestLevel1;

    init() {
        self.data = DeepNestLevel1{
            inner: DeepNestLevel2{
                next: DeepNestLevel3{ val: 99 }
            }
        };
    }
}