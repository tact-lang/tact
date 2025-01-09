primitive Slice;
primitive String;
primitive Int;

trait BaseTrait {

}

@name(__tact_str_to_slice)
extends native asSlice(self: String): Slice;

fun function() {
    let s: Slice = "123".asSlice();
    s.bits;
}