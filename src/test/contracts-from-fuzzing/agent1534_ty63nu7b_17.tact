struct SDefault {
    x: Int = 1;
    y: Bool = false;

}

contract StructWithDefaults {
    val: SDefault;
    init() {
        self.val = SDefault{ x:5, y:true };
    }
}