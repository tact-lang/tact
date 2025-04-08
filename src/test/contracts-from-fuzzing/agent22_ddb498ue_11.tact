struct OptionStruct {
    opInt: Int?;
    opBool: Bool?;
    opStr: String?;
}

struct Container {
    regInt: Int;
    optStruct: OptionStruct;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            regInt: 5,
            optStruct: OptionStruct{
                opInt: null,
                opBool: null,
                opStr: null
            }
        };
    }
}
