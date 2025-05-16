struct DeepOpt1 { a: Int?; }
struct DeepOpt2 { b: DeepOpt1?; }
struct DeepOpt3 { c: DeepOpt2?; }
struct DeepOpt4 { d: DeepOpt3?; }
struct DeepOpt5 { e: DeepOpt4?; }

contract TestContract {
    deepOpt: DeepOpt5;

    init() {
        self.deepOpt = DeepOpt5{
            e: DeepOpt4{
                d: DeepOpt3{
                    c: null
                }
            }
        };
    }
}