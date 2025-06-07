struct TestStruct {
    foo: Int;
    bar: String?;
}

contract NullDefaultOpt {
    data: TestStruct?;

    init() {
        // no assignment
    }
}