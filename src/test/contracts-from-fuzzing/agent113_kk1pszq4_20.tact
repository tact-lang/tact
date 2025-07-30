struct OptionalMix {
    title: String?;
    owner: Address?;
    count: Int?;
}

contract OptionalMixContract {
    data: OptionalMix;

    init() {
        self.data = OptionalMix{
            title: null,
            owner: myAddress(),
            count: null
        };
    }
}