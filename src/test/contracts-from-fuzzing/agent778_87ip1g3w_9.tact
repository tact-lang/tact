contract ManyPrimitiveFields {
    num1: Int = 1;
    num2: Int = 2;
    num3: Int = 3;
    flag1: Bool = true;
    num4: Int = 4;
    flag2: Bool = false;
    addr: Address;
    init() {
        self.addr = myAddress();
    }
}