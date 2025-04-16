struct MultiOpt {
    f1: Int?;
    f2: Int?;
    f3: Bool?;
    f4: String?;
}

contract TestContract {
    x: MultiOpt;

    init() {
        self.x = MultiOpt{
            f1: null, f2: 42, f3: null, f4: "hi"
        };
    }
}