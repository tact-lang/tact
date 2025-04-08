struct NestedStruct {
    innerVal: Int = 1;
    maybeInnerVal: Int?;
}

contract NestedStructTest {
    nested: NestedStruct = NestedStruct{};

    receive() {
        dump(self.nested.innerVal);
    }
}