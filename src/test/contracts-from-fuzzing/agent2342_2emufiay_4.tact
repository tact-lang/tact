struct Deep1 { val1: Int; }
struct Deep2 { val2: Deep1; }
struct Deep3 { val3: Deep2; }
struct Deep4 { val4: Deep3; }

contract DeeplyNested {
    deep: Deep4;

    init() {
        self.deep = Deep4{
            val4: Deep3{
                val3: Deep2{
                    val2: Deep1{
                        val1: 42
                    }
                }
            }
        };
    }
}