struct DefaultsComplex {
    x: Int = 1;
    y: Bool?;
    z: String = "default";
}

contract DefaultsMany {
    val: DefaultsComplex;

    init() {
        self.val = DefaultsComplex{ y: null };
    }
}
