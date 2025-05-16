struct DefaultsAndNulls {
    one: Int = 1;
    two: Bool? = null;
    three: String = "3";
}

contract MixDefaultsNulls {
    f: DefaultsAndNulls = DefaultsAndNulls{};
}