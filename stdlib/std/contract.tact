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

asm fun myAddress(): Address { MYADDR }

asm fun myBalance(): Int { BALANCE FIRST }

@name(gas_consumed)
native gasConsumed(): Int;

@name(get_compute_fee)
native getComputeFee(workchain: Int, gas_used: Int): Int;

@name(get_storage_fee)
native getStorageFee(workchain: Int, seconds: Int, bits: Int, cells: Int): Int;

@name(get_storage_fee)
native getForwardFee(workchain: Int, bits: Int, cells: Int): Int;

@name(get_simple_compute_fee)
native getSimpleComputeFee(workchain: Int, gas_used: Int): Int;

@name(get_simple_forward_fee)
native getSimpleForwardFee(workchain: Int, bits: Int, cells: Int): Int;

@name(get_original_fwd_fee)
native getOriginalFwdFee(workchain: Int, fwd_fee: Int): Int;

@name(my_storage_due)
native myStorageDue(): Int;
