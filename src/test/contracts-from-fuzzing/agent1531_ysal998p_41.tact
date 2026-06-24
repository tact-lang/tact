struct BigNested {
    outer1: Inner;
    outer2: Inner;
}

struct Inner {
    field1: Int;
    field2: String;
    field3: Bool;
    field4: Address;
}

contract Complex {
    data: BigNested;

    init() {
        self.data = BigNested{
            outer1: Inner{field1:1,field2:"a",field3:true,field4:myAddress()},
            outer2: Inner{field1:2,field2:"b",field3:false,field4:myAddress()},
        };
    }
}
