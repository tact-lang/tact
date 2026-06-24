struct ComplexFieldDigits {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Bool;
    a7: Bool;
    a8: Bool;
    a9: String;
    a10: String;
    a11: Address;
    a12: Address;
}

contract ComplexFieldsTest {
    data: ComplexFieldDigits;

    init() {
        self.data = ComplexFieldDigits{
            a1:1,a2:2,a3:3,a4:4,a5:5,a6:true,a7:false,a8:true,
            a9:"x",a10:"y",a11:myAddress(),a12:myAddress()
        };
    }
}