message(0xae42e5a4) InternalTransfer {
    queryID: Int as uint64;
    actions: Cell;
}

struct ExternalRequest {
    signature: Slice as bytes64;
    signedMsg: Cell;
}

struct QueryID {
    shift: Int as uint13;
    bitNumber: Int as uint10;
}

struct MsgInner {
    subwalletID: Int as uint32;
    messageToSend: Cell;
    sendMode: Int as uint8;
    queryID: QueryID;
    createdAt: Int as uint64;
    timeout: Int as uint22;
}

const SignatureMismatch: Int = 33;
const SubwalletIdMismatch: Int = 34;
const InvalidCreatedAt: Int = 35;
const AlreadyExecuted: Int = 36;
const InvalidMessageToSend: Int = 37;
const TimeoutMismatch: Int = 38;

contract HighloadWalletV3(
    publicKey: Int as uint256,
    subwalletID: Int as uint32,
    oldQueries: map<Int as uint13, Cell>,
    queries: map<Int as uint13, Cell>,
    lastCleanTime: Int as uint64,
    timeout: Int as uint22,
) {
    receive(msg: Slice) {} // just accept TONs

    receive(msg: InternalTransfer) {
        // not from myself
        if (!(sender() == myAddress())) {
            stopExecution(); // just accept TONs
        }

        setActions(msg.actions);
        setCode(myCode());
    }

    external(msgSlice: Slice) {
        let msg = ExternalRequest.fromSlice(msgSlice);

        if (self.lastCleanTime < (now() - self.timeout)) {
            self.oldQueries = self.queries;
            self.queries = null;
            if (self.lastCleanTime < (now() - (self.timeout * 2))) {
                self.oldQueries = null;
            }
            self.lastCleanTime = now();
        }

        throwUnless(SignatureMismatch, checkSignature(msg.signedMsg.hash(), msg.signature, self.publicKey));

        let msgInner = MsgInner.fromCell(msg.signedMsg);

        throwUnless(SubwalletIdMismatch, msgInner.subwalletID == self.subwalletID);
        throwUnless(TimeoutMismatch, msgInner.timeout == self.timeout);

        throwUnless(InvalidCreatedAt, msgInner.createdAt.inRange(now() - self.timeout, now()));

        let value = self.oldQueries.get(msgInner.queryID.shift);

        if (value != null) {
            let valueSlice = value!!.beginParse();
            valueSlice.skipBits(msgInner.queryID.bitNumber);
            throwIf(AlreadyExecuted, valueSlice.preloadInt(1) != 0);
        }

        value = self.queries.get(msgInner.queryID.shift);
        let newValue = beginCell();

        if (value != null) {
            let valueSlice = value!!.beginParse();
            let head = valueSlice.loadBits(msgInner.queryID.bitNumber);
            let tail = valueSlice;
            throwIf(AlreadyExecuted, tail.preloadInt(1) != 0);
            newValue = newValue.storeSlice(head).storeTrue().storeSlice(tail);
        } else {
            newValue = newValue.storeZeroes(msgInner.queryID.bitNumber).storeTrue().storeZeroes(CELL_BITS_SIZE - msgInner.queryID.bitNumber - 1);
        }

        acceptMessage();

        self.queries.set(msgInner.queryID.shift, newValue.endCell());

        setData(self.toCell());

        commit();

        // after commit, check the message to prevent an error in the action phase

        let messageSlice = msgInner.messageToSend.beginParse();
        /*
            https://github.com/ton-blockchain/ton/blob/8a9ff339927b22b72819c5125428b70c406da631/crypto/block/block.tlb#L123C1-L124C33
            currencies$_ grams:Grams other:ExtraCurrencyCollection = CurrencyCollection;
            extra_currencies$_ dict:(HashmapE 32 (VarUInteger 32)) = ExtraCurrencyCollection;

            https://github.com/ton-blockchain/ton/blob/8a9ff339927b22b72819c5125428b70c406da631/crypto/block/block.tlb#L135
            int_msg_info$0 ihr_disabled:Bool bounce:Bool bounced:Bool
            src:MsgAddress dest:MsgAddressInt
            value:CurrencyCollection ihr_fee:Grams fwd_fee:Grams
            created_lt:uint64 created_at:uint32 = CommonMsgInfoRelaxed;

            https://github.com/ton-blockchain/ton/blob/8a9ff339927b22b72819c5125428b70c406da631/crypto/block/block.tlb#L155
            message$_ {X:Type} info:CommonMsgInfoRelaxed
            init:(Maybe (Either StateInit ^StateInit))
            body:(Either X ^X) = MessageRelaxed X;
        */
        throwIf(InvalidMessageToSend, messageSlice.loadBool()); // int_msg_info$0

        let msgFlags = messageSlice.loadUint(3); // ihr_disabled:Bool bounce:Bool bounced:Bool
        if ((msgFlags & 1) == 1) { // is bounced
            stopExecution();
        }

        let messageSourceAddress = messageSlice.loadAddress();
        throwIf(InvalidMessageToSend, messageSourceAddress.asSlice().preloadUint(2) != 0);
        messageSlice.skipAddress(); // dest:MsgAddressInt
        messageSlice.skipCoins(); // value.coins
        messageSlice.skipMaybeRef(); // value.extra_currencies
        messageSlice.skipCoins(); // ihr_fee:Grams
        messageSlice.skipCoins(); // fwd_fee:Grams
        messageSlice.skipBits(64 + 32); // created_lt:uint64 created_at:uint32
        let maybeStateInit = messageSlice.loadBool();
        throwIf(InvalidMessageToSend, maybeStateInit); // throw if state-init included (state-init not supported)
        let eitherBody = messageSlice.loadBool();
        if (eitherBody) {
            messageSlice.skipRef();
            messageSlice.endParse();
        }

        sendRawMessage(msgInner.messageToSend, msgInner.sendMode | SendIgnoreErrors);
        stopExecution();
    }

    get fun get_public_key(): Int {
        return self.publicKey;
    }

    get fun get_subwallet_id(): Int {
        return self.subwalletID;
    }

    get fun get_last_clean_time(): Int {
        return self.lastCleanTime;
    }

    get fun get_timeout(): Int {
        return self.timeout;
    }

    get(0x1cbf2) fun is_processed(queryID: Int, needClean: Bool): Bool {
        let shift = queryID >> BIT_NUMBER_SIZE;
        let bitNumber = queryID & CELL_BITS_SIZE;

        if (needClean) {
            if (self.lastCleanTime < (now() - self.timeout)) {
                self.oldQueries = self.queries;
                self.queries = null;
                if (self.lastCleanTime < (now() - (self.timeout * 2))) {
                    self.oldQueries = null;
                }
                self.lastCleanTime = now();
            }
        }

        let value = self.oldQueries.get(shift);

        if (value != null) {
            let valueSlice = value!!.beginParse();
            valueSlice.skipBits(bitNumber);
            if (valueSlice.preloadInt(1) != 0) {
                return true;
            }
        }

        value = self.queries.get(shift);

        if (value != null) {
            let valueSlice = value!!.beginParse();
            valueSlice.skipBits(bitNumber);
            if (valueSlice.preloadInt(1) != 0) {
                return true;
            }
        }

        return false;
    }
}

const CELL_BITS_SIZE: Int = 1023;
const BIT_NUMBER_SIZE: Int = 10; // 2^10 = 1024

asm fun setActions(actions: Cell) { c5 POP }
asm fun setCode(code: Cell) { SETCODE }

asm(self to from) extends fun inRange(self: Int, from: Int, to: Int): Bool { s2 PUSH MAX MIN EQUAL }

asm extends fun storeZeroes(self: Builder, count: Int): Builder { STZEROES }
asm extends fun storeTrue(self: Builder): Builder { STONE }

asm fun stopExecution() { <{ }> PUSHCONT CALLCC }
