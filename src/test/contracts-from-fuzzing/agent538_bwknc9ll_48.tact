struct InitialStruct {
    a: Int;
    b: String;
}

contract AssignStructTwice {
    f: InitialStruct;
    init() {
        self.f = InitialStruct{a:1,b:"one"};
        self.f = InitialStruct{a:2,b:"two"};
    }
}