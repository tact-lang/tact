struct BothOptional {
    foo: Int?;
    bar: Bool?;
}

contract PartialValues {
    val: BothOptional;

    init() {
        self.val = BothOptional{
            foo: null,
            bar: true
        };
    }
}