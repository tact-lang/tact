struct Nested {
    field1: Int;
    field2: Int;
    field3: Int;
    field4: Int;
}

contract Test {
    n1: Nested;
    n2: Nested;
    n3: Nested;
    n4: Nested;

    init() {
        self.n1 = Nested{ field1:1, field2:2, field3:3, field4:4 };
        self.n2 = Nested{ field1:5, field2:6, field3:7, field4:8 };
        self.n3 = Nested{ field1:9, field2:10, field3:11, field4:12 };
        self.n4 = Nested{ field1:13, field2:14, field3:15, field4:16 };
    }
}