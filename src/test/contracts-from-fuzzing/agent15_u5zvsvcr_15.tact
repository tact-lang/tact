struct S {
    x: Int;
    y: Int;
}

contract TestFieldAccess {
    fun getS() : S {
         return S { x: 10, y: 20 };
    }
    
    receive() {
         let s: S = self.getS();
         let a: Int = s.x + s.y;
    }
}
