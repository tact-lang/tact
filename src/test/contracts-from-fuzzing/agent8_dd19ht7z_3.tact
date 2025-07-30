contract TestConstants {
    const ConstantValue: Int = 4 + 2;
    
    get fun getConstant(): Int {
         return self.ConstantValue;
    }
}
