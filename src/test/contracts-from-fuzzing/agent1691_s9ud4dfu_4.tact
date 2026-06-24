struct Mixed {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
    e: Slice;
    f: String;
}

contract MixedFieldsTest {
    data: Mixed;

    init() {
        self.data = Mixed{
            a:1, b:true, c:emptyCell(), d:myAddress(), e:emptyCell().asSlice(), f:"test"
        };
    }
}