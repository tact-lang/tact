struct DeepChain1 { next: DeepChain2; val: Int; }
struct DeepChain2 { next: DeepChain3; val: Int; }
struct DeepChain3 { next: DeepChain4; val: Int; }
struct DeepChain4 { next: DeepChain5; val: Int; }
struct DeepChain5 { val: Int; }

contract DeepFieldChain {
    root: DeepChain1;

    init() {
        self.root = DeepChain1{
            next: DeepChain2{
                next: DeepChain3{
                    next: DeepChain4{
                        next: DeepChain5{ val: 555 },
                        val: 444
                    },
                    val: 333
                },
                val: 222
            },
            val: 111
        };
    }
}