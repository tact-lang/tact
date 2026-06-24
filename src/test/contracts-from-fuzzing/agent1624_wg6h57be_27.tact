struct DefaultsAndNulls {
    constOne: Int = 1;
    constTwo: Bool = false;
    optString: String?;
    optAddress: Address?;
}

contract DefaultsOptionalsMix {
    data: DefaultsAndNulls;

    init() {
        self.data = DefaultsAndNulls{
            optString: null,
            optAddress: null,
        };
    }
}