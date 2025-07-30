contract TestAddressMap {
    m: map<Address, Int> = emptyMap();

    receive() {
         let addr: Address = sender();
         self.m.set(addr, 777);
         let got: Int = self.m.get(addr)!!;
         dump(got); // expected output: 777
    }
}
