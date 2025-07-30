struct ListOfOptionalStructs {
    one: OptStruct?;
    two: OptStruct?;
}

struct OptStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: ListOfOptionalStructs;

    init() {
        self.data = ListOfOptionalStructs{
            one: OptStruct{x: 1, y:true},
            two: null
        };
    }
}
