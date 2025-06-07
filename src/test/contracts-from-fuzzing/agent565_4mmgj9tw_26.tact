struct ComplexDefault {
    x: Int = 5;
    y: String = "str";
    z: Bool = true;
}
contract StructDefaults {
    val: ComplexDefault;
    init() {
        self.val = ComplexDefault{ x:6,y:"foo",z:false };
    }
}