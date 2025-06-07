struct ManyOptionals {
    f1: Int?; f2: Bool?; f3: String?; f4: Cell?; f5: Address?;
}

contract OptionalsBlob {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            f1: null, f2: null, f3: null, f4: null, f5: null
        };
    }
}