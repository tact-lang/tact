//
// String builder
//

@name(__tact_string_builder_start_string)
native beginString(): StringBuilder;

@name(__tact_string_builder_start_comment)
native beginComment(): StringBuilder;

@name(__tact_string_builder_append)
extends mutates native append(self: StringBuilder, s: String);

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

extends fun toCoinsString(self: Int): String {
    return self.toFloatString(self, 9);
}