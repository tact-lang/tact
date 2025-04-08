struct DefaultValues {
    foo: Int = 1;
    bar: Bool = true;
    baz: String = "abc";
    optInt: Int?;          
    optBool: Bool?;        
    optString: String?;
}

contract WithDefaults {
    d: DefaultValues;

    init() {
        self.d = DefaultValues{};
    }
}