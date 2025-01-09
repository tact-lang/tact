@name(hello_world)
native helloWorld(): Int;

@name(__tact_compute_contract_address)
native contractAddressExt(chain: Int, code: Cell, data: Cell): Address;
