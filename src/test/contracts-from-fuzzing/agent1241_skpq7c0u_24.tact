struct OptionStruct {
    s: Sub?;
}

struct Sub {
    a: Int;
    b: Bool;
}

contract OptionStructContract {
    data: OptionStruct;

    init() {
        self.data = OptionStruct{
            s: null
        };
    }
}
