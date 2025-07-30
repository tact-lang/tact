struct Deep {
    a: Int;
    b: Bool;
    c: String;
}

contract StorageTest {
    val: Deep;

    init() {
        self.val = Deep{a: 10, b: true, c: "hi"};
    }

    receive() {
        self.val = Deep{a: 11, b: false, c: "bye"};
    }
}
