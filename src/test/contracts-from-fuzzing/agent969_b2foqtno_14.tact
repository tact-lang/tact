struct OptMix {
    label: String?;
    receiver: Address?;
}

contract OptionalMixPersist {
    data: OptMix;

    init() {
        self.data = OptMix{
            label: null,
            receiver: myAddress()
        };
    }
}
