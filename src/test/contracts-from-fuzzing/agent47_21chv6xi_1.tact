struct A {
    a1: Int;
    a2: Bool;
    a3: String;
}

contract TestContract {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: A;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = "hi";
        self.field4 = A{ a1: 1, a2: false, a3: "bye" };
    }
}