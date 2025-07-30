struct Mix {
    fieldA: Int;
    fieldB: Bool;
    fieldC: Int?;
}

contract ComboTest {
    a: Mix?;
    b: Mix;

    init() {
        self.a = null;
        self.b = Mix{ fieldA:1, fieldB:true, fieldC:null };
    }
}
