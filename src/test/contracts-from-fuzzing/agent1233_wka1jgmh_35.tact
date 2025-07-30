// deeply nested optional address
struct IdStruct {
    id: Int;
    addr: Address?;
}

struct Wrapper {
    idStruct: IdStruct?;
}

contract OptAddressDeep {
    state: Wrapper;

    init() {
        self.state = Wrapper{
            idStruct: IdStruct{
                id: 1,
                addr: null
            }
        };
    }
}