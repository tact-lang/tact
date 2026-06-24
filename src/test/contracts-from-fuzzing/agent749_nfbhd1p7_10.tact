struct ManyOptionals {
    f0: Int?; f1: Bool?; f2: Address?; f3: String?; f4: Cell?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            f0: null,
            f1: null,
            f2: null,
            f3: null,
            f4: null,
        };
    }

    receive() {
        let _ = self.data.f0;
    }
}