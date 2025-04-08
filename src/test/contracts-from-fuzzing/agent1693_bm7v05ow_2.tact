struct DeepNested1 { val: Int; }
struct DeepNested2 { val: DeepNested1; }
struct DeepNested3 { val: DeepNested2; }
struct DeepNested4 { val: DeepNested3; }
struct DeepNested5 { val: DeepNested4; }

contract DeepTest {
    data: DeepNested5;

    init() {
        self.data = DeepNested5{
            val: DeepNested4{
                val: DeepNested3{
                    val: DeepNested2{
                        val: DeepNested1{ val: 42 }
                    }
                }
            }
        };
    }
}
