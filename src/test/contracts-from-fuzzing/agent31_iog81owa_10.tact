contract K(x: Int) {
    // Using contract parameters; no explicit init()
    receive("testK") {
       let addr1 = contractAddress(initOf K(self.x));
       let addr2 = contractAddress(initOf K(self.x));
       require(addr1 == addr2, "inconsistent K addresses");
       return;
    }
    
    // Getter function using initOf with a constant parameter
    get fun getAddr(): Address {
       return contractAddress(initOf K(42));
    }
}

contract L {
    // Testing that different parameters lead to different initOf results
    receive("testL") {
       let addr100 = contractAddress(initOf K(100));
       let addr101 = contractAddress(initOf K(101));
       require(addr100 != addr101, "addresses from different parameters should differ");
       return;
    }
}

contract M {
    stored: Address;

    init() {
       self.stored = contractAddress(initOf M());
    }

    receive("check") {
       let a = contractAddress(initOf M());
       require(a == self.stored, "M address mismatch");
       return;
    }
}

contract N {
    // Getter function that nests initOf calls
    get fun nested(): Address {
       let inner = contractAddress(initOf M());
       let outer = contractAddress(initOf N());
       return outer;
    }

    receive("trigger") {
       let x = self.nested();
       return;
    }
}

contract Q {
    // Testing conditional use of initOf calls
    get fun chooseAddr(cond: Bool): Address {
       return cond ? contractAddress(initOf Q()) : contractAddress(initOf Q());
    }

    receive("check") {
       let a1 = self.chooseAddr(true);
       let a2 = self.chooseAddr(false);
       require(a1 == a2, "Conditional chooseAddr should return same address");
       return;
    }
}
