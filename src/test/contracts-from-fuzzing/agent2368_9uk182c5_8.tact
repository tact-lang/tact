struct Inner {
    f1: Int;
    f2: Bool?;
    f3: String?;
    f4: Address?;
}

contract DeepNullables {
    data: Inner;

    init() {
        self.data = Inner{ f1: 123, f2: null, f3: null, f4: null };
    }
}