struct DeepOpt {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Cell?;
    f5: Slice?;
    f6: Address?;
}

contract DeeplyOptional {
    data: DeepOpt?;

    init() {
        self.data = null;
    }
}
