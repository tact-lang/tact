//
// String builder
//

/// Global function.
///
/// Creates and returns an empty `StringBuilder`.
///
/// ```tact
/// fun example(): String {
///     let fizz: StringBuilder = beginString();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-strings#beginstring
///
@name(__tact_string_builder_start_string)
native beginString(): StringBuilder;

/// Global function.
///
/// Creates and returns an empty `StringBuilder` for building a comment string, which prefixes
/// the resulting `String` with four null bytes. This format is used for passing text comments
/// as message bodies.
///
/// ```tact
/// fun example(): String {
///     let fizz: StringBuilder = beginComment();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-strings#begincomment
///
@name(__tact_string_builder_start_comment)
native beginComment(): StringBuilder;

/// Global function.
///
/// Creates and returns an empty `StringBuilder` for building a tail string, which prefixes
/// the resulting `String` with a single null byte. This format is used in various standards
/// such as NFT or Jetton.
///
/// ```tact
/// fun example(): String {
///     let fizz: StringBuilder = beginTailString();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-strings#begintailstring
///
@name(__tact_string_builder_start_tail_string)
native beginTailString(): StringBuilder;

/// Global function.
///
/// Creates and returns a new `StringBuilder` from an existing `StringBuilder` `b`. Useful when
/// you need to serialize an existing `String` to a `Cell` along with other data.
///
/// ```tact
/// fun example(): String {
///     let fizz: StringBuilder = beginStringFromBuilder(beginString());
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-strings#beginstringfrombuilder
///
@name(__tact_string_builder_start)
native beginStringFromBuilder(b: Builder): StringBuilder;

/// Extension mutation function for the `StringBuilder` type.
///
/// Appends a `String` `s` to the `StringBuilder`.
///
/// ```tact
/// fun example() {
///     let fizz: StringBuilder = beginString();
///     fizz.append("oh");
///     fizz.append("my");
///     fizz.append("Tact!");
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-strings#stringbuilderappend
///
@name(__tact_string_builder_append)
extends mutates native append(self: StringBuilder, s: String);

/// Extension function for the `StringBuilder` type.
///
/// Returns a new `StringBuilder` after concatenating it with a `String` `s`. It can be chained,
/// unlike `StringBuilder.append()`.
///
/// ```tact
/// fun example() {
///     let fizz: StringBuilder = beginString()
///         .concat("oh")
///         .concat("my")
///         .concat("Tact!");
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-strings#stringbuilderconcat
///
@name(__tact_string_builder_append_not_mut)
extends native concat(self: StringBuilder, s: String): StringBuilder;

/// Extension function for the `StringBuilder` type.
///
/// Returns an assembled `Cell` from a `StringBuilder`.
///
/// NOTE: **Gas expensive!** This function uses 500 gas units or more.
///
/// ```tact
/// fun example() {
///     let fizz: StringBuilder = beginString();
///     let buzz: Cell = fizz.toCell();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-strings#stringbuildertocell
///
@name(__tact_string_builder_end)
extends native toCell(self: StringBuilder): Cell;

/// Extension function for the `StringBuilder` type.
///
/// Returns a built `String` from a `StringBuilder`.
///
/// NOTE: **Gas expensive!** This function uses 500 gas units or more.
///
/// ```tact
/// fun example() {
///     let fizz: StringBuilder = beginString();
///     let buzz: String = fizz.toString();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-strings#stringbuildertostring
///
@name(__tact_string_builder_end_slice)
extends native toString(self: StringBuilder): String;

/// Extension function for the `StringBuilder` type.
///
/// Returns an assembled `Cell` as a `Slice` from a `StringBuilder`.
/// An alias to `self.toCell().asSlice()`.
///
/// NOTE: **Gas expensive!** This function uses 500 gas units or more.
///
/// ```tact
/// fun example() {
///     let s: StringBuilder = beginString();
///     let fizz: Slice = s.toSlice();
///     let buzz: Slice = s.toCell().asSlice();
///
///     fizz == buzz; // true
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-strings#stringbuildertoslice
///
@name(__tact_string_builder_end_slice)
extends native toSlice(self: StringBuilder): Slice;

//
// String conversion
//

/// Extension function for the `Int` type.
///
/// Returns a `String` from an `Int` value.
///
/// NOTE: **Gas expensive!** This function uses 500 gas units or more.
///
/// ```tact
/// fun example() {
///     let fizz: String = (84 - 42).toString();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-strings#inttostring
///
asm extends fun toString(self: Int): String {
    // x

    <{
        // x
        NEWC // x b
        OVER // x b x
        0 LESSINT // x b <0?
        <{
            // x b
            45 PUSHINT // x b 45
            SWAP // x 45 b
            8 STU // x b
            SWAP // b x
            NEGATE // b -x
            SWAP // -x b
        }>CONT IF
        // x b

        SWAP // b x

        <{
            // b x
            10 PUSHINT DIVMOD // b x/10 x%10
            48 ADDCONST // b x/10 (x%10+48)
            s2 s2 s0 XC2PU ISZERO // (x%10+48) b x/10 x/10==0?
        }>CONT UNTIL
        // ... b x

        DROP // ... b
        DEPTH DEC // ... b n
        <{ 8 STU }>CONT REPEAT // b
    }>CONT 1 1 CALLXARGS
    // b

    ENDC CTOS // s
}

/// Extension function for the `Int` type.
///
/// Returns a `String` from an `Int` value using a [fixed-point representation] of a fractional
/// number, where `self` is the significant part of the number and `digits` is the number
/// of digits in the fractional part.
///
/// NOTE: **Gas expensive!** This function uses 500 gas units or more.
///
/// ```tact
/// fun example() {
///     let fizz: String = (42).toFloatString(9); // "0.000000042"
/// }
/// ```
///
/// #### Exit codes
///
/// * 134: [Invalid argument] — Thrown when the given `digits` value is out of range.
///
/// See: https://docs.tact-lang.org/ref/core-strings#inttofloatstring
///
/// [fixed-point representation]: https://en.wikipedia.org/wiki/Fixed-point_arithmetic
/// [Invalid argument]: https://docs.tact-lang.org/book/exit-codes#134
///
asm extends fun toFloatString(self: Int, digits: Int): String {
    // x digits

    DUP // x digits digits
    1 LESSINT // x digits digits<=0
    134 THROWIF // x digits
    DUP // x digits digits
    77 GTINT // x digits digits>77
    134 THROWIF // x digits

    NEWC // x digits b
    ROTREV // b x digits
    s1 PUSH // b x digits x
    0 LESSINT // b x digits x<0?

    <{
        // b x digits
        ROT // x digits b
        x{2d} STSLICECONST // x digits b
        ROT // digits b x
        NEGATE // digits b -x
        ROT // b -x digits
    }>CONT IF

    // b x digits
    ONE // b x digits 1
    OVER // b x digits 1 digits

    <{ 10 MULCONST }>CONT REPEAT // b x digits 10^digits

    s1 s2 XCHG // b digits x 10^digits
    DIVMOD // b digits left right
    s3 s3 XCHG2 // right digits b left

    <{
        // b x

        <{
            // b x
            10 PUSHINT DIVMOD // b x/10 x%10
            48 ADDCONST // b x/10 (x%10+48)
            s2 s2 s0 XC2PU ISZERO // (x%10+48) b x/10 x/10==0?
        }>CONT UNTIL
        // ... b x

        DROP // ... b
        DEPTH DEC // ... b n
        <{ 8 STU }>CONT REPEAT // b
    }>CONT 2 1 CALLXARGS

    // right digits "left"

    ROT // digits "left" right
    DUP // digits "left" right right
    ISZERO // digits "left" right right==0?

    <{
        // digits "left" right
        DROP // digits "left"
        NIP // "left"
    }>CONT

    <{
        // digits "left" right
        ZERO // digits "left" right 0
        SWAP // digits "left" 0 right

        <{
            // digits "left" i right
            DUP // digits "left" i right right
            10 PUSHINT // digits "left" i right right 10
            MOD // digits "left" i right right%10
            ISZERO // digits "left" i right right%10==0?
        }>CONT

        <{
            // digits "left" i right
            10 PUSHINT // digits "left" i right 10
            DIV // digits "left" i right/10
            SWAP // digits "left" right/10 i
            INC // digits "left" right/10 i+1
            SWAP // digits "left" i+1 right/10
        }>CONT

        WHILE // digits "left" i right

        <{
            // x
            NEWC // x b
            SWAP // b x

            <{
                // b x
                10 PUSHINT DIVMOD // b x/10 x%10
                48 ADDCONST // b x/10 (x%10+48)
                s2 s2 s0 XC2PU ISZERO // (x%10+48) b x/10 x/10==0?
            }>CONT UNTIL
            // ... b x

            DROP // ... b
            DEPTH DEC DUP // ... b n n
            ROTREV // ... n b n
            <{
                // ... c n b
                s1 s2 XCHG // ... n c b
                8 STU // ... n b
            }>CONT REPEAT // n b
        }>CONT 1 2 CALLXARGS
        // digits "left" i right_digits "right"
        ROTREV // digits "left" "right" i right_digits
        ADD // digits "left" "right" right_digits

        s3 s1 XCHG // "right" "left" digits right_digits
        SUB // "right" "left" digits_diff
        SWAP // "right" digits_diff "left"
        x{2e} STSLICECONST // "right" digits_diff "left."
        SWAP // "right" "left." digits_diff

        <{
            // "right" "left."
            x{30} STSLICECONST // "right" "left.0"
        }>CONT REPEAT // "right" "left.000"

        STB // "left.000right"
    }>CONT

    IFELSE // b

    ENDC CTOS // s
}

/// Extension function for the `Int` type.
///
/// Returns a `String` from an `Int` value using a [fixed-point representation] of a fractional number.
/// An alias to `self.toFloatString(9)`.
///
/// This is used to represent [nanoToncoin] `Int` values using strings.
///
/// ```tact
/// fun example() {
///     let nanotons: Int = 42;
///     let fizz: String = nanotons.toCoinsString();
///     let buzz: String = nanotons.toFloatString(9);
///
///     fizz == buzz; // true, both store "0.000000042"
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-strings#inttocoinsstring
///
/// [fixed-point representation]: https://en.wikipedia.org/wiki/Fixed-point_arithmetic
/// [nanoToncoin]: https://docs.tact-lang.org/book/integers#nanotoncoin
///
inline extends fun toCoinsString(self: Int): String {
    return self.toFloatString(9);
}

/// Extension function for the `String` type.
///
/// Returns a `Cell` from a `String` by prefixing the latter with four null bytes.
/// This format is used for passing text comments as message bodies.
///
/// NOTE: **Gas expensive!** This function uses 500 gas units or more.
///
/// ```tact
/// fun example() {
///     let s: String = "When life gives you lemons, call them 'yellow oranges' and sell them for double the price.";
///     let fizz: Cell = s.asComment();
///
///     let b: StringBuilder = beginComment();
///     b.append(s);
///     let buzz: Cell = b.toCell();
///
///     fizz == buzz; // true
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-strings#stringascomment
///
extends fun asComment(self: String): Cell {
    let b: StringBuilder = beginComment();
    b.append(self);
    return b.toCell();
}

/// Extension function for the `String` type.
///
/// Casts the `String` back to the underlying `Slice` and returns it. The inverse of `Slice.asString()`.
///
/// ```tact
/// fun example() {
///     let s: String = "It's alive! It's alive!!!";
///     let fizz: Slice = s.asSlice();
///     let buzz: Slice = s.asSlice().asString().asSlice();
///
///     fizz == buzz; // true
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-strings#stringasslice
///
///
asm extends fun asSlice(self: String): Slice {}

/// Extension function for the `Slice` type.
///
/// Casts the `Slice` to a `String` and returns it. The inverse of `String.asSlice()`.
///
/// ```tact
/// fun example() {
///     let s: String = "Keep your Slices close, but your Strings closer.";
///     let fizz: String = s;
///     let buzz: String = s.asSlice().asString();
///
///     fizz == buzz; // true
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-cells#sliceasstring
///
asm extends fun asString(self: Slice): String {}

/// Extension function for the `Slice` type.
///
/// Returns a new `Slice` from the decoded [base64] `Slice`.
///
/// Note that this function is limited and only takes the first 1023 bits of data from
/// the given `Slice`, without throwing an exception if the `Slice` has more data
/// (i.e., when it has any references).
///
/// If the given `Slice` contains characters not from the base64 set, an exception with
/// [exit code 134] will be thrown: `Invalid argument`.
///
/// NOTE: **Gas expensive!** This function uses 500 gas units or more.
///
/// ```tact
/// fun example() {
///     let s: Slice = "SSBhbSBHcm9vdC4=".asSlice();
///     let fizz: Slice = s.fromBase64();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-strings#stringfrombase64
///
/// [exit code 134]: https://docs.tact-lang.org/book/exit-codes#134
/// [base64]: https://en.wikipedia.org/wiki/Base64
inline extends fun fromBase64(self: String): Slice {
    return self.asSlice().fromBase64();
}

/// Extension function for the `String` type.
///
/// Returns a `Slice` from the decoded [base64] `String`.
/// An alias to `self.asSlice().fromBase64()`.
///
/// Note that this function is limited and only takes the first 1023 bits of data from
/// the given `String`, without throwing an exception when the `String` is larger
/// (i.e., contains more than 1023 bits of data).
///
/// NOTE: **Gas expensive!** This function uses 500 gas units or more.
///
/// ```tact
/// fun example() {
///     let s: String = "SGVyZSdzIEpvaG5ueSE=";
///     let fizz: Slice = s.fromBase64();
///     let buzz: Slice = s.asSlice().fromBase64();
///
///     fizz == buzz; // true
/// }
/// ```
///
/// #### Exit codes
///
/// * 134: [Invalid argument] — Thrown when the given `String` contains characters not from the base64 set.
///
/// See: https://docs.tact-lang.org/ref/core-cells#slicefrombase64
///
/// [Invalid argument]: https://docs.tact-lang.org/book/exit-codes#134
/// [base64]: https://en.wikipedia.org/wiki/Base64
///
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
            throw(TactExitCodeInvalidArgument);
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

/// Extension function for the `Address` type.
///
/// Returns a `String` from an `Address`.
///
/// ```tact
/// fun example() {
///     let community: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
///     let fizz: String = community.toString();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-addresses#addresstostring
///
@name(__tact_address_to_user_friendly)
extends native toString(self: Address): String;
