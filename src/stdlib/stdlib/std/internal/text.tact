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

asm extends fun toFloatString(self: Int, digits: Int): String  {
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