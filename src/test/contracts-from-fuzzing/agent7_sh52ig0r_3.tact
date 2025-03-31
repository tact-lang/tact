struct AddressPair {
    a: Address;
    b: Address;
}

/* Test 1: Simple cross-contract initialization */
contract SimpleB {
    init(x: Int) {}
}

contract SimpleA {
    fun getBAddress(): Address {
        let s = initOf SimpleB(123);
        return contractAddress(s);
    }
}

/* Test 2: Multi-level parent-child relationships */
contract ChildC {
    init(z: Int) {}
}

contract ParentB {
    init(y: Int) {
        // internal usage of initOf in constructor
        let s = initOf ChildC(y + 1);
    }
}

contract TopA {
    fun testMulti(): Address {
         let s = initOf ParentB(10);
         return contractAddress(s);
    }
}

/* Test 3: Recursive initialization */
contract SelfRecursive {
    init() {
        // Recursive call: self-referential initialization
        // This may be allowed since initOf is compile-time computed
        let s = initOf SelfRecursive();
    }
    get fun dummy(): Int {
       return 42;
    }
}

/* Test 4: Complex nested contract graphs using struct for return value */
contract NestedC1 {
    init(a: Int) {}
}

contract NestedC2 {
    init(b: Int) {}
}

contract NestedX {
    fun mix(): AddressPair {
         let s1 = initOf NestedC1(55);
         let s2 = initOf NestedC2(66);
         return AddressPair { a: contractAddress(s1), b: contractAddress(s2) };
    }
}

/* Test 5: Trailing comma in init parameters */
contract TrailingP {
   init(a: Int, b: Int, ) {}  // allowed trailing comma
}

contract TrailingQ {
   fun getAddress(): Address {
      let s = initOf TrailingP(10,20,);
      return contractAddress(s);
   }
}

/* Test 6: Cross-contract in function parameters */
contract ParamContract {
    init(a: Int) {}
}

contract Holder {
    fun getParamAddress(p: Int): Address {
       let s = initOf ParamContract(p);
       return contractAddress(s);
    }
}
