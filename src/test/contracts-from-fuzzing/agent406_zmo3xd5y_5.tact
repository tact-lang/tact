struct DeepOpt3 {
    m: String?;
}

struct DeepOpt2 {
    d3: DeepOpt3?;
    val: Int?;
}

struct DeepOpt1 {
    d2: DeepOpt2?;
    txt: String;
}

contract DeepOptional {
    rec: DeepOpt1;
    init() {
        self.rec = DeepOpt1{
            d2: DeepOpt2{
                d3: DeepOpt3{
                    m: "hello"
                },
                val: null
            },
            txt: "x"
        };
    }
}