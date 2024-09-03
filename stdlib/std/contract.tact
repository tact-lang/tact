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

asm fun sendMessage(msg: Cell, mode: Int): Int { SENDMSG }

asm fun gasConsumed(): Int { GASCONSUMED }

asm(gas_used workchain) fun getComputeFee(workchain: Int, gas_used: Int): Int { GETGASFEE }

asm(cells bits seconds workchain) fun getStorageFee(workchain: Int, seconds: Int, bits: Int, cells: Int): Int { GETSTORAGEFEE }

asm(cells bits workchain) fun getForwardFee(workchain: Int, bits: Int, cells: Int): Int { GETFORWARDFEE }

asm(gas_used workchain) fun getSimpleComputeFee(workchain: Int, gas_used: Int): Int { GETGASFEESIMPLE }

asm(cells bits workchain) fun getSimpleForwardFee(workchain: Int, bits: Int, cells: Int): Int { GETFORWARDFEESIMPLE }

asm(fwd_fee workchain) fun getOriginalFwdFee(workchain: Int, fwd_fee: Int): Int { GETORIGINALFWDFEE }

asm fun myStorageDue(): Int { DUEPAYMENT }
