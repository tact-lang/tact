struct OptMix {
    count: Int?;
    owner: Address?;
    label: String;
}

contract MixOptStruct {
    info: OptMix = OptMix{count: null, owner: null, label: ""};

    init() {
        self.info = OptMix{count: 5, owner: null, label: "test"};
    }
}