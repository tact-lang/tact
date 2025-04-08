struct NestedOptStruct {
    innerOpt: Int?;
    innerString: String;
}

contract StorageWithOpt {
    f: NestedOptStruct?;

    init() {
        self.f = NestedOptStruct{
            innerOpt: 123,
            innerString: "testopt",
        };
    }
}