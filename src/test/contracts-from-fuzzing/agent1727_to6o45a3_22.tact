// test nested optionals as contract root field (optional struct)
struct InnerStruct {
    a: Int?;
    b: Bool;
}

contract OptionalStructTop {
    data: InnerStruct?;
    
    receive() {
        self.data = InnerStruct{
            a: 123,
            b: true,
        };
    }
}