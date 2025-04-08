struct DeepOpt3 { val3: Int? }
struct DeepOpt2 { val2: DeepOpt3? }
struct DeepOpt1 { val1: DeepOpt2? }

contract TestContract {
    data: DeepOpt1;

    init() {
        self.data = DeepOpt1{
            val1: DeepOpt2{
                val2: DeepOpt3{ val3: 999 }
            }
        };
    }
}