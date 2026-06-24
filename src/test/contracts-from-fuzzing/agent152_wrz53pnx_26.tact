struct Combination {
    optInt: Int?;
    optBool: Bool?;
    str: String;
    optAddr: Address?;
    optSlice: Slice?;
    optCell: Cell?;
}

contract CombinationTest {
    val: Combination;

    init() {
        self.val = Combination{
            optInt: null, optBool: null, str: "s", optAddr: null, optSlice: null, optCell: null
        };
    }
}