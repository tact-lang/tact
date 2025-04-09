struct Alpha {
    value: Int as int32;
}

struct Beta {
    first: Alpha;
    second: Int as uint4;
    third: Bool;
    fourth: Address;
}

contract SerializationMix {
    storage: Beta;

    init() {
        self.storage = Beta{
            first: Alpha{value: -12},
            second: 12,
            third: true,
            fourth: myAddress()
        };
    }
}