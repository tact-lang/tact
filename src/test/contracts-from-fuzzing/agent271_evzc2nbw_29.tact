struct DeepDefaultsNulls {
    a: Int = 1;
    b: Int? = null;
    inner: InnerD;
}

struct InnerD {
    x: Int = 2;
    y: Int? = null;
}

contract MixDeepDefaultsNulls {
    d: DeepDefaultsNulls;

    init() {
        self.d = DeepDefaultsNulls{ inner: InnerD{} };
    }
}
