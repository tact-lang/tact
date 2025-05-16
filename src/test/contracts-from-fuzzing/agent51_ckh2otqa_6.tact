struct OptionHolder {
    foo: Int?;
    bar: Cell?;
}

contract Test {
    data: OptionHolder;
    init() {
        self.data = OptionHolder{
            foo: null,
            bar: null
        };
    }
}