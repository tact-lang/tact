trait MyTrait {
    const CONST_VALUE: Int = 256;
}

contract Test1 with MyTrait {
    get fun getValue(): Int {
        return self.CONST_VALUE;
    }
}
