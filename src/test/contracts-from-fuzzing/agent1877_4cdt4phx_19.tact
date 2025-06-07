struct StructWithAddressString {
  addr: Address;
  name: String;
}

contract PersistAddrStr {
  data: StructWithAddressString;

  init() {
    self.data = StructWithAddressString{
      addr: myAddress(),
      name: "myname" 
    };
  }
}
