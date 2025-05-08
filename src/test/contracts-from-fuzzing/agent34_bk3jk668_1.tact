contract Child {
    init() {}
}

contract Parent {
    fun getChildAddress(): Address {
         let childInit = initOf Child();
         return contractAddress(childInit);
    }
}
