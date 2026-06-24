contract TestAddressComparison {
    fun test() : Bool {
         let initPkg: StateInit = initOf TestAddressComparison();
         let a1: Address = contractAddress(initPkg);
         let acc: Int = contractHash(initPkg.code, initPkg.data);
         let a2: Address = newAddress(0, acc);
         return a1 == a2;
    }
}
