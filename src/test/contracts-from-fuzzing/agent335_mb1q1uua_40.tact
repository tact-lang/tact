struct NestedPtrs1 { a: Int; }
struct NestedPtrs2 { ptr: NestedPtrs1; }
struct NestedPtrs3 { ptr: NestedPtrs2; }
struct NestedPtrs4 { ptr: NestedPtrs3; }

contract FourLayerNestedPtrs {
    data: NestedPtrs4;

    init() {
        self.data = NestedPtrs4{
            ptr: NestedPtrs3{
                ptr: NestedPtrs2{
                    ptr: NestedPtrs1{
                        a: 777
                    }
                }
            }
        };
    }
}