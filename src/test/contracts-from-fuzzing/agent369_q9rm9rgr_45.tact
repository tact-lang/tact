struct OptionStruct {
    v: Int?;
}

contract TestContract {
    a: OptionStruct?;

    init() {
        self.a = OptionStruct{v:null};
    }
}