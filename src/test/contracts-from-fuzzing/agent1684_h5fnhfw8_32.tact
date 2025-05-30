struct OptStrs {
    s1: String? = null;
    s2: String? = null;
    s3: String? = null;
    s4: String? = null;
    s5: String? = null;
}

contract ManyOptionalStrings {
    os: OptStrs = OptStrs{
        s1: null, s2: null, s3: null, s4: null, s5: null
    };
}