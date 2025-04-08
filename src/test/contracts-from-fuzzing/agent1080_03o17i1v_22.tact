struct OptionalAddresses {
 addr1: Address?;
 addr2: Address?;
}

contract AddressOptTest {
 data: OptionalAddresses;

 init() {
   self.data = OptionalAddresses{
     addr1: null,
     addr2: null,
   };
 }
}