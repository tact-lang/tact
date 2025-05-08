struct DeepDefOpt {
    a: Int = 1;
    b: Bool?;
    c: String? = null;
}

contract DeepDefOptContract {
    d: DeepDefOpt;

    init() {
        self.d = DeepDefOpt{ a:2, b:null, c:null };
    }
}