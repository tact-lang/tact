struct OptionalLayer {
    opt1: Int?;
    opt2: Bool?;
    opt3: Slice?;
    opt4: Cell?;
    opt5: Address?;
    opt6: String?;
}

contract TestContract {
    data: OptionalLayer;

    init() {
        self.data = OptionalLayer{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null,
            opt6: null,
        };
    }
}