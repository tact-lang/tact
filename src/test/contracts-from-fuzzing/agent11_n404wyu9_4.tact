contract Dummy {}

fun test_hasSameBasechainAddress_false(): Bool {
  let s: StateInit = initOf Dummy();
  let addr: Address = newAddress(0, 0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef);
  return !s.hasSameBasechainAddress(addr);
}

fun test_contractAddressExt_masterchain(): Address {
  let s: StateInit = initOf Dummy();
  return contractAddressExt(-1, s.code, s.data);
}
