/* Fuzz-testing Tact contract addresses and related functionalities with valid BoC cell encoding */

// Test newAddress with valid workchain ids
fun test_newAddress_valid(): Address {
    // Valid: workchain id 0
    return newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
}

fun test_newAddress_masterchain(): Address {
    // Valid: masterchain id -1
    return newAddress(-1, 0xdeadbeef);
}

// The below base64 string is taken from official documentation's example for a StateInit BoC
const dummyCellBoc: String = "te6cckEBAQEAYgAAwP8AIN0gggFMl7qXMO1E0NcLH+Ck8mCDCNcYINMf0x/TH/gjE7vyY+1E0NMf0x/T/9FRMrryoVFEuvKiBPkBVBBV+RDyo/gAkyDXSpbTB9QC+wDo0QGkyMsfyx/L/8ntVD++buA=";

// Test contractAddressExt by creating dummy code and data cells using compile-time cell()
fun test_contractAddressExt_valid(): Address {
    let dummyCode = cell(dummyCellBoc);
    let dummyData = cell(dummyCellBoc);
    return contractAddressExt(0, dummyCode, dummyData);
}

// Contract that uses compile-time address assignment
contract Example {
    addr: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
    // Getter function for the stored address
    get fun getAddr(): Address {
       return self.addr;
    }
}

// Test the extension functions on Address
fun test_address_toString(): String {
   let a = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
   return a.toString();
}

fun test_address_asSlice(): Bool {
   let a = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
   let s1 = beginCell().storeAddress(a).asSlice();
   let s2 = a.asSlice();
   return s1 == s2;
}

// Test basechain address functionality
fun test_basechain_address(): Bool {
    let emptyAddr = emptyBasechainAddress();
    let newAddr = newBasechainAddress(0x12345678);
    return (emptyAddr.hash == null) && (newAddr.hash == 0x12345678);
}

// Test contractHash and its combination with newAddress and contractAddressExt
fun test_contractHash(): Bool {
   let dummyCode = cell(dummyCellBoc);
   let dummyData = cell(dummyCellBoc);
   let h = contractHash(dummyCode, dummyData);
   let addr1 = newAddress(0, h);
   let addr2 = contractAddressExt(0, dummyCode, dummyData);
   return addr1 == addr2;
}

fun main() {
    let _ = test_newAddress_valid();
    let _ = test_newAddress_masterchain();
    let _ = test_contractAddressExt_valid();
    let s = test_address_toString();
    let b = test_address_asSlice();
    let b2 = test_basechain_address();
    let b3 = test_contractHash();
    // Note: Contract functions (like Example.getAddr()) require on-chain call context
}
