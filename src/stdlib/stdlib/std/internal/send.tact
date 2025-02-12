asm fun nativeSendMessage(cell: Cell, mode: Int) { SENDRAWMSG }

asm fun nativeSendMessageReturnForwardFee(msg: Cell, mode: Int): Int { SENDMSG }

const SendRemainingBalance: Int = 128;
const SendRemainingValue: Int = 64;
const SendDefaultMode: Int = 0;
const SendIgnoreErrors: Int = 2;
const SendPayGasSeparately: Int = 1;
const SendDestroyIfZero: Int = 32;
const SendBounceIfActionFail: Int = 16;
const SendOnlyEstimateFee: Int = 1024;

struct SendParameters {
    mode: Int = 0;
    body: Cell? = null;
    code: Cell? = null;
    data: Cell? = null;
    value: Int;
    to: Address;
    bounce: Bool = true;
}


/// Global function. Queues the message to be sent using a `SendParameters` Struct.
///
/// Attempts to queue more than 255 messages throw an exception with an exit code 33: `Action list is too long`.
///
/// ```tact
/// fun example() {
///     send(SendParameters{
///         to: sender(),    // back to the sender,
///         value: ton("1"), // with 1 Toncoin (1_000_000_000 nanoToncoin),
///                          // and no message body
///     });
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-common#send
///
asm fun send(params: SendParameters) {
    // Instructions are grouped, and the stack states they produce as a group are shown right after.
    // In the end, our message Cell should have the following TL-B structure:
    // message$_ {X:Type}
    //   info:CommonMsgInfoRelaxed
    //   init:(Maybe (Either StateInit ^StateInit))
    //   body:(Either X ^X)
    // = MessageRelaxed X;

    // → Stack state
    // s0: `params.bounce`
    // s1: `params.to`
    // s2: `params.value`
    // s3: `params.data`
    // s4: `params.code`
    // s5: `params.body`
    // s6: `params.mode`
    // For brevity, the "params" prefix will be omitted from now on.

    // Group 1: Storing the `bounce`, `to` and `value` into a Builder
    NEWC
    b{01} STSLICECONST  // store tag = $0 and ihr_disabled = true
    1 STI               // store `bounce`
    b{000} STSLICECONST // store bounced = false and src = addr_none
    STSLICE             // store `to`
    SWAP
    STGRAMS             // store `value`
    105 PUSHINT         // 1 + 4 + 4 + 64 + 32
    STZEROES            // store currency_collection, ihr_fee, fwd_fee, created_lt and created_at
    // → Stack state
    // s0: Builder
    // s1: `data`
    // s2: `code`
    // s3: `body`
    // s4: `mode`

    // Group 2: Placing the Builder after code and data, then checking those for nullability
    s2 XCHG0
    DUP2
    ISNULL
    SWAP
    ISNULL
    MUL // note that -1 * -1 wraps back to -1
    // → Stack state
    // s0: -1 (true) if `data` and `code` are both null, 0 (false) otherwise
    // s1: `code`
    // s2: `data`
    // s3: Builder
    // s4: `body`
    // s5: `mode`

    // Group 3: Left branch of the IFELSE, executed if s0 is -1 (true)
    <{
        DROP2 // drop `data` and `code`, since either of those is null
        NULL  // push a single null
        SWAP  // place Builder on top
    }> PUSHCONT

    // Group 3: Right branch of the IFELSE, executed if s0 is 0 (false)
    <{
        // _ split_depth:(Maybe (## 5))
        //   special:(Maybe TickTock)
        //   code:(Maybe ^Cell)
        //   data:(Maybe ^Cell)
        //   library:(Maybe ^Cell)
        // = StateInit;
        NEWC               // start composing StateInit
        b{00} STSLICECONST // split_depth and special
        STDICT             // store code
        STDICT             // store data
        b{0} STSLICECONST  // store library
        ENDC               // end composing StateInit
        SWAP               // place Builder on top
        b{1} STSLICECONST  // an extra bit for storing StateInit as ref
    }> PUSHCONT

    // Group 3: IFELSE that does the branching shown above
    IFELSE
    // → Stack state
    // s0: Builder
    // s1: null or StateInit
    // s2: `body`
    // s3: `mode`

    // Group 4: Finalizing the message
    STDICT // store StateInit
    STDICT // store `body` as ref with an extra Maybe bit, since `body` might be null
    ENDC
    // → Stack state
    // s0: Cell
    // s1: `mode`

    // Group 5: Sending the message, with `mode` on top
    SWAP
    SENDRAWMSG // https://github.com/tact-lang/tact/issues/1558
}

struct DeployParameters {
    mode: Int = SendDefaultMode;
    body: Cell? = null;
    value: Int;
    bounce: Bool = true;
    init: StateInit;
}

/// Deploys a contract in basechain with specified StateInit
asm fun deploy(params: DeployParameters): Cell {
    // Group 1: Preparation of needed params
    //
    // Params are specified above
    //
    // → Stack state
    // ....
    // s1: code
    // s0: data
    4 1 BLKPUSH
    // → Stack state
    // ....
    // s5: code
    // s4: data
    // s3: code
    // s2: data
    // s1: code
    // s0: data
    HASHCU
    SWAP
    HASHCU
    // → Stack state
    // ....
    // s5: code
    // s4: data
    // s3: code
    // s2: data
    // s1: hash(data)
    // s0: hash(code)
    SWAP2
    CDEPTH
    SWAP
    CDEPTH
    // → Stack state
    // ....
    // s5: code
    // s4: data
    // s3: hash(data)
    // s2: hash(code)
    // s1: depth(data)
    // s0: depth(code)
    //
    // Group 2: Calculating destination address
    //
    NEWC
    b{000000100000000100110100} STSLICECONST // Consult https://docs.tact-lang.org/book/cells/#cells-representation for more information
    // The main trick we are doing here is calculating hash-part of address without using ENDC.
    16 STU
    16 STU
    256 STU
    256 STU
    ONE // Argument of HASHEXT_SHA256 - We need to hash only one builder
    HASHEXT_SHA256
    //
    // Group 3: Building a message
    //
    // → Stack state
    // s6: params.mode
    // s5: params.body
    // s4: params.value
    // s3: params.bounce
    // s2: code
    // s1: data
    // s0: destAddr(hash part)
    s3 XCHG0
    NEWC
    b{01} STSLICECONST  // store tag = $0 and ihr_disabled = true
    1 STI
    // → Stack state
    // s6: params.mode
    // s5: params.body
    // s4: params.value
    // s3: destAddr(hash part)
    // s2: code
    // s1: data
    // s0: msgBuilder
    s1 s2 XCHG
    STREF // Save code (we are building inline StateInit, StateInit bits will be stored further)
    STREF // Save data
    b{00010000000000} STSLICECONST
    // 0 + 00 + 10 + 0 + 00000000
    // 1) 0 - bounced = false
    // 2) 00 - src = addr_none
    // 3) 10 - tag of addr_std (part of dest)
    // 4) 0 - Maybe Anycast = false
    // 5) 00000000 - workchain_id (part of dest)
    256 STU // Store address (hash part)
    // → Stack state
    // s3: params.mode
    // s2: params.body
    // s1: params.value
    // s0: msgBuilder
    SWAP
    STGRAMS // Store value
    105 PUSHINT         // 1 + 4 + 4 + 64 + 32
    STZEROES // store currency_collection, ihr_fee, fwd_fee, created_lt and created_at
    // Finished building CommonMsgInfoRelaxed and building remaining of MessageRelaxed
    b{1000110} STSLICECONST
    // 10 + 0 + 0 + 1 + 1 + 0
    // 10 - Maybe (Either StateInit ^StateInit) = true false
    // 0 - split_depth:(Maybe (## 5)) = false
    // 0 = special:(Maybe TickTock) = false
    // 1 = code:(Maybe ^Cell) = true
    // 1 = data:(Maybe ^Cell) = true
    // 0 = library:(Maybe ^Cell) = false
    //
    // → Stack state
    // s2: params.mode
    // s1: params.body
    // s0: msgBuilder
    STDICT // Store body (using STDICT as body may be null)
    ENDC
    // Group 4: Sending the message, with `mode` on top
    SWAP
    SENDRAWMSG
}

inline fun emit(body: Cell) {
    // ext_out_msg_info$11 src:MsgAddressInt dest:MsgAddressExt created_lt:uint64 created_at:uint32
    //                     maybe: stateInit (false) bodyRef: bool (true)
    let c: Cell = beginCell()
        .storeUint(15211807202738752817960438464513, 104)
        .storeRef(body)
        .endCell();
    nativeSendMessage(c, 0);
}

asm fun acceptMessage() { ACCEPT }

asm fun commit() { COMMIT }
