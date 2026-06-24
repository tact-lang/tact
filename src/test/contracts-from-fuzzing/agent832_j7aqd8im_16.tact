struct Deep {
    val: Int;
    str: String;
}

contract FieldOrderTest {
    field1: Bool = true;
    field2: Int = 99;
    field3: String = "abc";
    field4: Deep = Deep{val: 1, str: "x"};
    receive() {
        let _ = self.field4.str;
    }
}