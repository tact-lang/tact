struct DeepOptA { next: DeepOptB?; val: Int?; }
struct DeepOptB { next: DeepOptC?; val: Int?; }
struct DeepOptC { next: DeepOptD?; val: Int?; }
struct DeepOptD { val: Int?; }

contract ChainOptionalContract {
    storage: DeepOptA;
    init() {
        self.storage = DeepOptA{
            next: DeepOptB{
                next: DeepOptC{
                    next: DeepOptD{
                        val:null
                    }, val:null
                }, val:null
            }, val:null
        };
    }
}