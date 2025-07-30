struct Wrapper {
    payload: Payload;
}

struct Payload {
    header: Int;
    data: DataStruct;
}

struct DataStruct {
    sub1: Sub;
    sub2: Sub;
}

struct Sub {
    value: Int;
    flag: Bool;
    opt: Int?;
}

contract Test {
    storage: Wrapper;

    init() {
        self.storage = Wrapper{
            payload: Payload{
                header: 777,
                data: DataStruct{
                    sub1: Sub{ value: 1, flag: true, opt: null },
                    sub2: Sub{ value: 2, flag: false, opt: 99 }
                }
            }
        };
    }
}