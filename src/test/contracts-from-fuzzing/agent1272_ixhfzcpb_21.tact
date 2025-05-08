struct MultipleNullable {
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
    optSlice: Slice?;
    optCell: Cell?;
    optAddr: Address?;
}

contract AllNullInit {
    val: MultipleNullable;
    init() {
        self.val = MultipleNullable{
            optInt: null,
            optStr: null,
            optBool: null,
            optSlice: null,
            optCell: null,
            optAddr: null
        };
    }
}
