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
    bounce: Bool = true;
    to: Address;
    value: Int;
    mode: Int = 0;
    body: Cell? = null;
    code: Cell? = null;
    data: Cell? = null;
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

    // Group 1: Rearrangements
    3 4 BLKSWAP
    s2 XCHG0
    // → Stack state
    // s0: `params.bounce`
    // s1: `params.to`
    // s2: `params.value`
    // s3: `params.data`
    // s4: `params.code`
    // s5: `params.body`
    // s6: `params.mode`
    // For brewity, the "params" prefix will be omitted from now on.

    // Group 2: Storing the `bounce`, `to` and `value` into a Builder
    NEWC
    b{01} STSLICECONST  // store tag = $0, ihr_disabled = true
    1 STI               // store `bounce`
    b{000} STSLICECONST // store src_addr = addr_none
    STSLICE             // store `to`
    SWAP
    STGRAMS             // store nanotons
    105 PUSHINT         // 1 + 4 + 4 + 64 + 32
    STZEROES            // store currency_collection, ihr_fee, fwd_fee, created_lt and created_at
    // → Stack state
    // s0: Builder
    // s1: `data`
    // s2: `code`
    // s3: `body`
    // s4: `mode`

    // Group 3: Placing the Builder after code and data, then checking those for nullability
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

    // Group 4: Left branch of the IFELSE, executed if s0 is -1 (true)
    <{
        DROP2 // drop `data` and `code`, since either of those is null
        NULL  // push a single null
        SWAP  // place Builder on top
    }> PUSHCONT

    // Group 4: Right branch of the IFELSE, executed if s0 is 0 (false)
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

    // Group 4: IFELSE that does the branching shown above
    IFELSE
    // → Stack state
    // s0: Builder
    // s1: null or StateInit
    // s2: `body`
    // s3: `mode`

    // Group 5: Finilizing building the message
    STDICT // store StateInit
    STDICT // store `body` as ref with an extra Maybe bit, since `body` might be null
    ENDC   // finilize the Builder as a Cell
    // → Stack state
    // s0: Cell
    // s1: `mode`

    // Group 6: Sending the message, with `mode` on top
    SWAP
    SENDRAWMSG // https://github.com/tact-lang/tact/issues/1558
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
