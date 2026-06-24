struct MyStruct {
    a: Int;
    b: Bool;
}

contract CompositeGetter {
    st: MyStruct;

    init() {
        self.st = MyStruct { a: 10, b: true };
    }

    // Getter returning a composite type (struct)
    get fun getStruct(): MyStruct {
        return self.st;
    }

    // receiver to ensure full compilation
    receive() {}
}
