struct Boo {
    v1: Int;
}

contract ManyStructs {
    field1: Boo;
    field2: Boo;
    field3: Boo;

    init() {
        self.field1 = Boo{v1:1};
        self.field2 = Boo{v1:2};
        self.field3 = Boo{v1:3};
    }
}