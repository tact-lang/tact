@name(cell_hash)
extends native hash(self: Cell): Int;

@name(slice_hash)
extends native hash(self: Slice): Int;

@name(check_signature)
native checkSignature(hash: Int, signature: Slice, public_key: Int): Bool;

@name(check_data_signature)
native checkDataSignature(data: Slice, signature: Slice, public_key: Int): Bool;
