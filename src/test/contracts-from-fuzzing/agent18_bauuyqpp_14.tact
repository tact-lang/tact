contract TestChainedExpressions {
    const NUM: Int = 123;

    fun showcase() {
         // Using 'self.NUM' to reference a contract-level constant
         dump(self.NUM.toString().asComment());
    }
}
