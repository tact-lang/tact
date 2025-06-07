struct InnerStruct {
    foo: Int;
}

contract DeepInit {
    deep: InnerStruct = InnerStruct{ foo: 1 };
    receive() {
        let _ = self.deep.foo;
    }
}