struct Deep1 { a: Int; }
struct Deep2 { deep1: Deep1; }
struct Deep3 { deep2: Deep2; }
struct Deep4 { deep3: Deep3; }

contract DeepHierarchy {
    top: Deep4;

    init() {
        self.top = Deep4{
            deep3: Deep3{
                deep2: Deep2{
                    deep1: Deep1{a: 777}
                }
            }
        };
    }
}