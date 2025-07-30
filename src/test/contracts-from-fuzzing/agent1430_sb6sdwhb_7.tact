struct Param1 {
    field: Int;
}

struct Param2 {
    param1: Param1;
    opt: Bool?;
}

struct Param3 {
    param2: Param2;
    name: String;
}

contract Test {
    complex: Param3;

    init() {
        self.complex = Param3{
            param2: Param2{
                param1: Param1{
                    field: 5
                },
                opt: null
            },
            name: "nested"
        };
    }
}
