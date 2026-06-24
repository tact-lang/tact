struct DeepNested5 { val5: Int; }
struct DeepNested4 { val4: DeepNested5; }
struct DeepNested3 { val3: DeepNested4; }
struct DeepNested2 { val2: DeepNested3; }
struct DeepNested1 { val1: DeepNested2; }

contract DeepNestTest {
    deepVal: DeepNested1;

    init() {
        self.deepVal = DeepNested1{
            val1: DeepNested2{
                val2: DeepNested3{
                    val3: DeepNested4{
                        val4: DeepNested5{
                            val5: 7
                        }
                    }
                }
            }
        };
    }
}
