struct DefaultsAndNulls {
    intField: Int = 5;
    strField: String = "s";
    optField: Bool?;
}

contract MixedInit {
    m: DefaultsAndNulls;

    init() {
        self.m = DefaultsAndNulls{ optField: null };
    }
}