struct Inner {
    a: Int;
    b: Bool;
}

contract StorageNested {
    innerField: Inner = Inner{a: 1, b: true};

    receive() {
        let x = self.innerField.a;
        let y = self.innerField.b;
    }
}