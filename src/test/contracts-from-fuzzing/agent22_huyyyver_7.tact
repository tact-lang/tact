struct A { x: Int; }

contract TestIdentifierAndFieldAccess {
    fun getX(): Int {
        let a: A = A { x: 99 };
        return a.x;  // Expected result: 99
    }

    receive() {
        let result = self.getX();
        result;
    }
}
