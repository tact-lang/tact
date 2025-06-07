contract ConstInside {
    const MY_CONST: Int = 100;
    a: Int = self.MY_CONST / 2;
    
    receive() {
         let b: Int = self.MY_CONST + 50;
    }
}
