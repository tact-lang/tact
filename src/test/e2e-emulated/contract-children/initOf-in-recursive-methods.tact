contract Test {
    receive() {}

    fun method1(cond: Bool): Address {
        return cond ? contractAddress(initOf MasterV0()) : self.method2(cond);
    }

    fun method2(cond: Bool): Address {
        return self.method1(cond);
    }
}

contract MasterV0 {
    state: Int = 0;

    get fun state(): Int {
        return self.state;
    }
}
