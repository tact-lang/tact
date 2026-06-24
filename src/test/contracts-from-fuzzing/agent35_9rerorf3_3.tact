contract TestAddresses {
    fun testNewAddress() : Address {
         return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    }
    
    fun testContractAddress(s: StateInit) : Address {
         return contractAddress(s);
    }
    
    fun testContractAddressExt(s: StateInit) : Address {
         return contractAddressExt(0, s.code, s.data);
    }
    
    fun testAddressAsSlice(a: Address) : Slice {
         return a.asSlice();
    }
    
    fun testAddressToString(a: Address) : String {
         return a.toString();
    }
    
    fun testEmptyBasechainAddress() : Bool {
         let e = emptyBasechainAddress();
         return (e.hash == null);
    }
    
    fun testNewBasechainAddress() : Bool {
         let b = newBasechainAddress(1234567890);
         return (b.hash != null);
    }
    
    receive() {
         let a1 = self.testNewAddress();
         let s: StateInit = initOf TestAddresses();
         let a2 = self.testContractAddress(s);
         let a3 = self.testContractAddressExt(s);
         let _ = self.testAddressAsSlice(a1);
         let _ = self.testAddressToString(a1);
         let _ = self.testEmptyBasechainAddress();
         let _ = self.testNewBasechainAddress();
         cashback(sender());
    }
}
