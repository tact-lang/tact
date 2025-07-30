struct SomeStruct {
    i: Int;
    b: Bool;
}

contract Test {
    data: SomeStruct?;

    init() {
        self.data = SomeStruct{ i:1, b:true };
    }
}
