struct StateInit {
    code: Cell;
    data: Cell;
}

@name(__tact_compute_contract_address)
native contractAddressExt(chain: Int, code: Cell, data: Cell): Address;

inline fun contractAddress(s: StateInit): Address {
    return contractAddressExt(0, s.code, s.data);
}

@name(__tact_address_to_slice)
extends native asSlice(self: Address): Slice;

@name(__tact_create_address)
native newAddress(chain: Int, hash: Int): Address;

@name(my_address)
native myAddress(): Address;

@name(__tact_my_balance)
native myBalance(): Int;