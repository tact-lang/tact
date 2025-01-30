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

/*
int_msg_info$0 ihr_disabled:Bool bounce:Bool bounced:Bool
  src:MsgAddress dest:MsgAddressInt
  value:CurrencyCollection ihr_fee:Grams fwd_fee:Grams
  created_lt:uint64 created_at:uint32 = CommonMsgInfoRelaxed;

message$_ {X:Type} info:CommonMsgInfoRelaxed
  init:(Maybe (Either StateInit ^StateInit))
  body:(Either X ^X) = MessageRelaxed X;

bounce: s6
to: s5
value: s4
mode: s3
body: s2
code: s1
data: s0
*/
asm fun send(params: SendParameters) {
    3 4 BLKSWAP
    s2 XCHG0
    /*
    These two instructions do this
    mode: s6
    body: s5
    code: s4
    data: s3
    value: s2
    to: s1
    bounce: s0
    */
    NEWC
    b{01} STSLICECONST // Store tag = $0, ihr_disabled = true
    1 STI // Store bounce
    b{000} STSLICECONST // Store src_addr = addr_none
    STSLICE // Store to
    SWAP // Because STGRAMS is kinda reversed b x - b'
    STGRAMS // Store grams
    105 PUSHINT // 1 + 4 + 4 + 64 + 32
    STZEROES // Store currency_collection + IHR fees + Fwd fees + CreatedLT + CreatedAt
    /*
    mode: s4
    body: s3
    code: s2
    data: s1
    MessageBuilder: s0
    */
    s2 XCHG0 // We want to check, if code or data is NULL, so place a builder under them
    /*
    mode: s4
    body: s3
    MessageBuilder: s2
    data: s1
    code: s0
    */
    DUP2
    ISNULL
    SWAP
    ISNULL
    MUL
    /*
    mode: s4
    body: s3
    MessageBuilder: s2
    data: s1
    code: s0
    0 if any of them is not-null
    -1 if both are null
    */
    <{
        DROP2 // drop extra code and data
        NULL // push NULL
        SWAP
        /*
        mode: s4
        body: s3
        NULL: s1
        MessageBuilder: s0
        */
    }> PUSHCONT
    <{
        /*
        mode: s4
        body: s3
        MessageBuilder: s2
        data: s1
        code: s0
        */
        /*
        _ split_depth:(Maybe (## 5)) special:(Maybe TickTock)
            code:(Maybe ^Cell) data:(Maybe ^Cell)
            library:(Maybe ^Cell) = StateInit;
        */
        NEWC // Assemble state init
        b{00} STSLICECONST // SplitDepth and TickTock
        STDICT // Store code
        STDICT // Store data
        b{0} STSLICECONST // Store library
        ENDC // Completed building StateInit
        SWAP
        /*
        mode: s2
        body: s1
        StateInitCell: s1
        MessageBuilder: s0
        */
        b{1} STSLICECONST // StateInit will be saved as ref (Either bit)
        // init:(Maybe (Either StateInit ^StateInit))
    }> PUSHCONT
    IFELSE
    /*
    mode: s2
    body: s1
    StateInitCell: s1 OR NULL
    MessageBuilder: s0
    */
    STDICT // Save state init (and Maybe bit)
    STDICT // Save body as ref and place Maybe bit (body also may be NULL)
    ENDC // We finished building message!
    /*
    mode: s2
    MessageCell: s0
    */
    SWAP // Because SENDRAWMSG does that (in terms of stack): `c x - ` where x is the mode, and c in the message
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
