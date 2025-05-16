struct NestedDeep1 { val: Int; }
struct NestedDeep2 { prev: NestedDeep1; }
struct NestedDeep3 { prev: NestedDeep2; }
struct NestedDeep4 { prev: NestedDeep3; }

contract DeepChain {
    data: NestedDeep4;
    init() {
        self.data = NestedDeep4{
            prev: NestedDeep3{
                prev: NestedDeep2{
                    prev: NestedDeep1{ val: 7 }
                }
            }
        };
    }
}