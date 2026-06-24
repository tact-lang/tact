struct OptionalDeep {
    level1: Int?;
    level2: Bool?;
}

struct OptionalMid {
    deep: OptionalDeep?;
}

contract NestedOptionalStructFields {
    data: OptionalMid = OptionalMid{deep: null};
    receive() {
        if (self.data.deep != null) {
            let _ = self.data.deep!!;
        }
    }
}