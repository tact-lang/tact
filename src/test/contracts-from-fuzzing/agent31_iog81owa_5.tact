contract D(param: Int) {
    // A contract with a parameter list; note that no explicit init() is defined
    receive("test") {
         let pkg = initOf D(42);
         let addr = contractAddress(pkg);
         return;
    }
}

contract E {
    foo: Int = 123;
    
    // Getter function using initOf
    get fun computeAddr(): Address {
         let pkg = initOf E();
         return contractAddress(pkg);
    }
}

contract G {
    receive("test") {
      // Testing self-referential initOf in a simple form
      let pkg = initOf G();
      let addr1 = contractAddress(pkg);
      let addr2 = myAddress();
      require(addr1 == addr2, "addr mismatch");
      return;
    }
}
