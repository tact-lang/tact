struct DefaultOptMix {
    a: Int = 1;
    b: Int?;
    c: Bool = true;
    d: String? = null;
}

contract ComboDefaultsNested {
    val: DefaultOptMix;

    init() {
        self.val = DefaultOptMix{ b: null };
    }
}