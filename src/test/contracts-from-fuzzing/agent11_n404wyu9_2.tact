contract Dummy {}

fun test_newAddress_valid(): Address {
  return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

fun test_contractAddress(): Bool {
  let s: StateInit = initOf Dummy();
  let addr1: Address = contractAddress(s);
  let addr2: Address = contractAddressExt(0, s.code, s.data);
  return addr1 == addr2;
}

fun test_contractHash(): Bool {
  let s: StateInit = initOf Dummy();
  let h: Int = contractHash(s.code, s.data);
  let addr1: Address = newAddress(0, h);
  let addr2: Address = contractAddress(s);
  return addr1 == addr2;
}

fun test_forceBasechain_valid() {
  let addr: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
  forceBasechain(addr);
}

fun test_forceBasechain_invalid(): Bool {
  let addr: Address = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
  try {
    forceBasechain(addr);
    return false; // No exception thrown
  } catch (exitCode) {
    // Expected exit code 138
    return exitCode == 138;
  }
}

fun test_address_asSlice(): Bool {
  let a: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
  let slice1: Slice = beginCell().storeAddress(a).asSlice();
  let slice2: Slice = a.asSlice();
  return slice1 == slice2;
}

fun test_address_toString(): String {
  let a: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
  return a.toString();
}

fun test_emptyBasechainAddress(): Bool {
  let emptyAddr: BasechainAddress = emptyBasechainAddress();
  return emptyAddr.hash == null;
}

fun test_newBasechainAddress(): Bool {
  let b: BasechainAddress = newBasechainAddress(0x123456789abcdef0);
  return b.hash == 0x123456789abcdef0;
}
