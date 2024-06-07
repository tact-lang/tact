//
// String builder
//

@name(__tact_string_builder_start_string)
native beginString(): StringBuilder;

@name(__tact_string_builder_start_comment)
native beginComment(): StringBuilder;

@name(__tact_string_builder_start_tail_string)
native beginTailString(): StringBuilder;

@name(__tact_string_builder_start)
native beginStringFromBuilder(b: Builder): StringBuilder;

@name(__tact_string_builder_append)
extends mutates native append(self: StringBuilder, s: String);

@name(__tact_string_builder_append_not_mut)
extends native concat(self: StringBuilder, s: String): StringBuilder;

@name(__tact_string_builder_end)
extends native toCell(self: StringBuilder): Cell;

@name(__tact_string_builder_end_slice)
extends native toString(self: StringBuilder): String;

@name(__tact_string_builder_end_slice)
extends native toSlice(self: StringBuilder): Slice;

//
// String conversion
//

@name(__tact_int_to_string)
extends native toString(self: Int): String;

@name(__tact_float_to_string)
extends native toFloatString(self: Int, digits: Int): String;

inline extends fun toCoinsString(self: Int): String {
    return self.toFloatString(9);
}

extends fun asComment(self: String): Cell {
    let b: StringBuilder = beginComment();
    b.append(self);
    return b.toCell();
}

@name(__tact_str_to_slice)
extends native asSlice(self: String): Slice;

@name(__tact_slice_to_str)
extends native asString(self: Slice): String;

inline extends fun fromBase64(self: String): Slice {
    return self.asSlice().fromBase64();
}

extends fun fromBase64(self: Slice): Slice {
    let size: Int = self.bits() / 8;
    let result: Builder = beginCell();

    repeat (size) {
        let code: Int = self.loadUint(8);
        if (code >= 65 && code <= 90) { // A-Z
            result = result.storeUint(code - 65, 6);
        } else if (code >= 97 && code <= 122) { // a-z
            result = result.storeUint(code - (97 - 26), 6);
        } else if (code >= 48 && code <= 57) { // 0-9
            result = result.storeUint(code + (52 - 48), 6);
        } else if (code == 45 || code == 43) { // - or +
            result = result.storeUint(62, 6);
        } else if (code == 95 || code == 47) { // _ or /
            result = result.storeUint(63, 6);
        } else if (code == 61) { // =
            // Skip
        } else {
            throw(134);
        }
    }

    // Padding
    let total: Int = result.bits();
    let padding: Int = total % 8;
    if (padding != 0) {
        let s: Slice = result.asSlice();
        return s.loadBits(total - padding);
    } else {
        return result.asSlice();
    }
}

//
// Address conversion
//

@name(__tact_address_to_user_friendly)
extends native toString(self: Address): String;