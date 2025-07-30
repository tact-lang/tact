struct DeepOptionalChain1 { next: DeepOptionalChain2?; }
struct DeepOptionalChain2 { next: DeepOptionalChain3?; }
struct DeepOptionalChain3 { next: DeepOptionalChain4?; }
struct DeepOptionalChain4 { next: DeepOptionalChain5?; }
struct DeepOptionalChain5 { value: Int?; }

contract DeepOptHolder {
    root: DeepOptionalChain1;

    init() {
        self.root = DeepOptionalChain1{
            next: null
        };
    }
}
