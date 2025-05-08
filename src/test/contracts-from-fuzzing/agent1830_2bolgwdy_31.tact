struct SubStruct {
    x: Int as uint16;
    y: String;
    z: Bool?;
}

struct ContainerStruct {
    sub1: SubStruct;
    sub2: SubStruct?;
}

contract TestContract {
    persistent1: ContainerStruct;
    flag: Bool?;
    number: Int as uint32;
    text: String;
    addressVal: Address?;

    init() {
        self.persistent1 = ContainerStruct{
            sub1: SubStruct{ x:123, y:"abc", z:true },
            sub2: null
        };
        self.flag = false;
        self.number = 777;
        self.text = "aaa";
        self.addressVal = null;
    }
}
