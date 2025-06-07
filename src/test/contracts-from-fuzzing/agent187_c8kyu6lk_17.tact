struct OptDeep {
    nested: InnerOpt?;
}

struct InnerOpt {
    leaf: Int?;
}

contract StorageNestedOptionalTest {
    data: OptDeep;

    init() {
        self.data = OptDeep{
            nested: null
        };
    }
}