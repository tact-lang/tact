struct Base {
    foo: Int as uint8;
    bar: Int as int16;
}

struct OptionHolder {
    base: Base?;
}

contract TestContract {
    field: OptionHolder?;

    init() {
        self.field = OptionHolder{
            base: Base{ foo: 12, bar: -123 },
        };
    }
}