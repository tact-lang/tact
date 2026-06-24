struct HasAddresses {
 a: Address;
 b: Address;
 c: Address;
}

contract AddressTest {
 v: HasAddresses;

 init() {
   self.v = HasAddresses{
     a: myAddress(),
     b: myAddress(),
     c: myAddress(),
   };
 }
}