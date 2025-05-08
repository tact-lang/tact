contract TestNewAddressValid {
    fun test() : Int {
        // Valid workchain id 0, valid hash value
        let a: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        return 42;
    }
}

contract TestNewAddressMasterchain {
    fun test() : Int {
        // Valid masterchain id (-1) and a simple hash
        let a: Address = newAddress(-1, 0x12345678);
        return 42;
    }
}

contract TestAsSlice {
    fun test() : Bool {
        let a: Address = newAddress(0, 0xabcdef);
        let s: Slice = a.asSlice();
        let s2: Slice = beginCell().storeAddress(a).asSlice();
        return s == s2;
    }
}

contract TestBasechainAddress {
    fun test_new() : Bool {
        let b: BasechainAddress = newBasechainAddress(42);
        return b.hash == 42;
    }
    fun test_empty() : Bool {
        let b: BasechainAddress = emptyBasechainAddress();
        return b.hash == null;
    }
}

contract Dummy {}

contract TestContractAddress {
    fun test() : Bool {
        let s: StateInit = initOf Dummy();
        let a1: Address = contractAddress(s);
        let a2: Address = contractAddressExt(0, s.code, s.data);
        return a1 == a2;
    }
}

contract TestAddressEquality {
    fun test() : Bool {
        let a1: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        let a2: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        let a3: Address = newAddress(0, 0);
        return (a1 == a2) && !(a1 == a3);
    }
}

contract TestBoundaryHash {
    fun test_zero() : Bool {
        let a: Address = newAddress(0, 0);
        return true;
    }
    fun test_max() : Bool {
        let a: Address = newAddress(0, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
        return true;
    }
}
