struct HasOption {
    foo: Int?;
}

struct OuterHasOptional {
    inner: HasOption;
    bar: String;
}

contract NestedOptInsideStruct {
    payload: OuterHasOptional;

    init() {
        self.payload = OuterHasOptional{
            inner: HasOption{foo:null},
            bar: "abc"
        };
    }
}
