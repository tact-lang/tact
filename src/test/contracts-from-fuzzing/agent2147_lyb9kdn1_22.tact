struct MixedDeep {
    optInt: Int? = null;
    defInt: Int = 1;
    optBool: Bool?;
    defBool: Bool = true;
}

contract MixedStore {
    state: MixedDeep = MixedDeep{};
}