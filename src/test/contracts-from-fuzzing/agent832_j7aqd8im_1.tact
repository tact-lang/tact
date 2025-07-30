struct InnerStruct {
    innerVal: Int;
    innerFlag: Bool;
}

contract NestedStructContract {
    nested: InnerStruct = InnerStruct{innerVal: 7, innerFlag: false};

    receive() {
        let _ = self.nested.innerVal;
    }
}