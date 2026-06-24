struct DeepMix {
    name: String?;
    ownerAddr: Address?;
    count: Int = 42;
    flag: Bool = false;
}

contract MixOpt {
    nest: DeepMix = DeepMix{ name: null, ownerAddr: null, count: 7, flag: true };
    init() {}
}