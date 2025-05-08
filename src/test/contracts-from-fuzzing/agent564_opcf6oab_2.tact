struct NestedOptStruct {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract TestNestedOptionals {
    val: NestedOptStruct? = null;

    init() {
        self.val = NestedOptStruct{
            x: 777,
            y: true,
            z: null,
        };
    }
}
