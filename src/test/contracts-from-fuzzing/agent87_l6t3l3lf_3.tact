struct Data {
    a: Int;
    b: Bool;
}

contract TestStruct {
    receive() {}

    // Getter returning a composite type (struct) using correct literal syntax
    get fun getData(): Data {
        return Data{a: 42, b: true};
    }
}
