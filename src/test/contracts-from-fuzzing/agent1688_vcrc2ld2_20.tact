struct NestedLevel1 { i: Int; }
struct NestedLevel2 { n: NestedLevel1; }
struct NestedLevel3 { n2: NestedLevel2; }

contract TestContract {
    payload: NestedLevel3;
    init() {
        self.payload = NestedLevel3{
            n2: NestedLevel2{
                n: NestedLevel1{
                    i: 314
                }
            }
        };
    }
}