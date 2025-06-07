struct NestedOptionalStruct {
    nestedInt: Int?;
    inner: InnerStruct?;
}

struct InnerStruct {
    someBool: Bool;
    someString: String;
}

contract TestContract {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            nestedInt: null,
            inner: null,
        };
    }
}

fun trigger() {
    // triggers nothing, contract usage for compiler only
}

contract User {
    receive() {
        trigger();
    }
}