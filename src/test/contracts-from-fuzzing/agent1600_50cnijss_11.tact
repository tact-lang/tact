struct SomeStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    myData: SomeStruct?;

    init() {
        self.myData = null;
    }
}