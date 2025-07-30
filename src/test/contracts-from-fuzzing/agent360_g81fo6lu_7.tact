struct Sub {
    field1: Int;
    field2: Bool;
}

contract TestContract {
    sub1: Sub;
    sub2: Sub;
    sub3: Sub;
    sub4: Sub;

    init() {
        self.sub1 = Sub{ field1: 1, field2: true };
        self.sub2 = Sub{ field1: 2, field2: false };
        self.sub3 = Sub{ field1: 3, field2: true };
        self.sub4 = Sub{ field1: 4, field2: false };
    }
}