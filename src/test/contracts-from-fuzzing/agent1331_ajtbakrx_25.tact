struct StructVal { x: Int }
contract InitStruct {
    val: StructVal;

    init() {
        self.val = StructVal{ x: 11 };
    }
}