struct Mix {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    ad: Address;
    ao: Address?;
}

contract MixedStorage {
    data: Mix;

    init() {
        self.data = Mix{
            i: 10,
            b: true,
            s: "mix",
            o: null,
            ad: myAddress(),
            ao: null,
        };
    }
}
