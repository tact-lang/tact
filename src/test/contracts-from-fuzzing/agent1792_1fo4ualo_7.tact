struct RecStruct {
    sub: SubStruct?;
}

struct SubStruct {
    value: Int;
    flag: Bool;
}

contract TestContract {
    data: RecStruct;

    init() {
        self.data = RecStruct{
            sub: SubStruct{
                value: 5,
                flag: false
            }
        };
    }
}