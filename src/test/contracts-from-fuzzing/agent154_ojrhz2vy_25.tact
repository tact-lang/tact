struct DeepOptLevel4 {
    d: Int?;
}

struct DeepOptLevel3 {
    c: DeepOptLevel4?;
}

struct DeepOptLevel2 {
    b: DeepOptLevel3?;
}

struct DeepOptLevel1 {
    a: DeepOptLevel2?;
}

contract OptionalDeepChain {
    val: DeepOptLevel1;

    init() {
        self.val = DeepOptLevel1{ a: null };
    }
}