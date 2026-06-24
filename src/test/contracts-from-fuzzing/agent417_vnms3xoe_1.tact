struct InnerStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    val: InnerStruct;
    
    init() {
        self.val = InnerStruct{
            foo: 1,
            bar: true,
        };
    }
}