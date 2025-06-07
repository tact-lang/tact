struct Deep1 { val: Int }
struct Deep2 { deep1: Deep1 }
struct Deep3 { deep2: Deep2 }
struct Deep4 { deep3: Deep3 }
struct Deep5 { deep4: Deep4 }

contract Test {
    deep: Deep5;

    init() {
        self.deep = Deep5{
            deep4: Deep4{
                deep3: Deep3{
                    deep2: Deep2{
                        deep1: Deep1{ val: 42 }
                    }
                }
            }
        };
    }
}