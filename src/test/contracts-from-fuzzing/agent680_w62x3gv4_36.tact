struct OpStruct {
    foo: Int?;
}

contract NestedOptWithDefaultStruct {
    o: OpStruct = OpStruct{foo: null};

    init() {
        self.o = OpStruct{foo: 123};
    }

    receive() {
        let _ = self.o.foo != null ? self.o.foo!! : 0;
    }
}