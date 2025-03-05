import "@stdlib/deploy";

/*
    TODO: fix tags
    actions

    out_list$_ {n:#} prev:^(OutList n) action:OutAction = OutList (n + 1);
    action_send_msg#0ec3c86d mode:(## 8) out_msg:^(MessageRelaxed Any) = OutAction;

    action_list_basic$_ {n:#} actions:^(OutList n) = ActionList n 0;
    action_list_extended$_ {m:#} {n:#} action:ExtendedAction prev:^(ActionList n m) = ActionList n (m+1);
    
    action_list#00 actions:^(OutList n) = ExtendedAction;
    action_send_msg#01 mode:(## 8) out_msg:^(MessageRelaxed Any) = ExtendedAction;
    action_set_signature_policy#02 is_allowed:(## 1) = ExtendedAction;
    action_add_ext#03 addr:MsgAddressInt = ExtendedAction;
    action_delete_ext#04 addr:MsgAddressInt = ExtendedAction;
*/

struct InternalOperation {
    walletId: Int as uint32;
    validUntil: Int as uint32;
    seqno: Int as uint32;
    actions: Slice as remaining;
}

message(0x7369676E) CompatibleSignedRequest {
    walletId: Int as uint32;
    validUntil: Int as uint32;
    seqno: Int as uint32;
    outActions: Cell?;
    hasOtherActions: Bool;
    data: Slice as remaining;
}

message(0x73696e74) InternalSignedRequest {
    data: Slice as remaining;
}

message SignedRequest {
    signature: Slice as bytes64;
    operation: InternalOperation;
}


message InternalExtensionRequest {
    actions: Slice as remaining;
}

asm fun countTrailingZeroes(s: Slice): Int { SDCNTTRAIL0 }
struct SliceFlag {
    data: Slice;
    flag: Bool;
}
asm extends fun beginParseRaw(self: Cell): SliceFlag { XCTOS }
asm extends mutates fun enforceAndRemoveActionSendMsgPrefix(self: Slice) { x{0ec3c86d} SDBEGINS}
asm fun setC5(outActions: Cell) { c5 POP }
asm fun hach1(asd: Slice): CompatibleSignedRequest {}

contract Wallet with Deployable {
    isSignatureAllowed: Bool;
    seqno: Int as uint32;
    walletId: Int as int32;
    publicKey: Int as uint256;
    extensions: map<Address, Bool>;

    init(publicKey: Int, walletId: Int, extensions: map<Address, Bool>) {
        self.isSignatureAllowed = true;
        self.publicKey = publicKey;
        self.seqno = 0;
        self.walletId = walletId;
        self.extensions = extensions;
    }

    inline fun processSignedRequestCompatible(msg: CompatibleSignedRequest, isExternal: Bool) {
        let signature = msg.toSlice().lastBits(512);
        let signedSlice = msg.toSlice().skipLastBits(512);

        let isSignatureValid = checkSignature(signedSlice.hash(), signature, self.publicKey);
        if (!isSignatureValid) {
            if (isExternal) {
                throw(135);
            } else {
                return;
            }
        }

        throwIf(132, !self.isSignatureAllowed && self.extensions.isEmpty());
        throwUnless(1, msg.seqno == self.seqno);
        throwUnless(1, msg.walletId == self.walletId);
        throwIf(1, msg.validUntil <= now());

        if (isExternal) {
            acceptMessage();
        }

        self.seqno += 1;
        commit();

        signedSlice.skipBits(32 + 32 + 32 + 32); // skip opcode, walletId, validUntil, seqno
        self.processActionsCompatible(signedSlice, isExternal, false);
    }

    /*
    actions has the following structure:

    {
        outActions: Cell?;
        hasOtherActions: Bool;
        actions: Slice as remaining;
    }
    */
    inline fun processActionsCompatible(actions: Slice, isExternal: Bool, isExtension: Bool) {
        let outActions = actions.loadMaybeRef();
        if (outActions != null) {
            setC5(self.processSendMessagesCompatible(outActions!!, isExternal));
        }

        if (!actions.loadBool()) {
            return;
        }

        while (true) {
            // check tag, process action, try to load next ref while we can
        }
    }

    inline fun processSendMessagesCompatible(outActions: Cell, isExternal: Bool): Cell {
        let cs = outActions.beginParseRaw().data;
        let count = 0;

        while (!cs.empty()) {
            cs.enforceAndRemoveActionSendMsgPrefix();

            throwUnless(1, cs.bits() == 8);
            throwUnless(2, cs.refs() == 2);
            throwIf(3, isExternal && (countTrailingZeroes(cs.preloadBits(7)) > 0));

            cs = cs.preloadRef().beginParseRaw().data;
            count += 1;
        }

        throwUnless(1, count <= 255);
        throwUnless(1, cs.refs() == 0);

        return outActions;
    }

    fun processSignedRequest(msg: SignedRequest, isExternal: Bool) {
        require(checkSignature(msg.operation.toCell().hash(), msg.signature, self.publicKey), "Invalid signature");

        require(msg.operation.seqno == self.seqno, "Invalid seqno");
        require(msg.operation.walletId == self.walletId, "Invalid walletId");
        require(now() < msg.operation.validUntil, "Operation expired");
        
        if (isExternal) {
            acceptMessage();
        }

        self.seqno = (self.seqno + 1);
        // NOTE: currently unsafe!
        // TODO: add c4 save in asm here 
        commit();

        // self.processActions(msg.operation.actions, isExternal, false);
    }

    receive(_: Slice) {
        // Fallback
    }

    receive(msg: InternalExtensionRequest) {
        if (self.extensions.get(sender()) != true) {
            return;
        }
        // require(self.extensions.get(sender()) == true, "Unauthorized extension");
        // self.processActions(msg.actions, false, true);
    }

    receive(msg: InternalSignedRequest) {
        self.processSignedRequestCompatible(hach1(msg.data), false);
    }

    external(msg: CompatibleSignedRequest) {
        self.processSignedRequestCompatible(msg, true);
    }

    get fun seqno(): Int {
        return self.seqno;
    }

    get fun get_subwallet_id(): Int {
        return self.walletId;
    }

    get fun get_public_key(): Int {
        return self.publicKey;
    }

    get fun is_plugin_installed(wc: Int, addressHash: Int): Bool {
        return self.extensions.exists(newAddress(wc, addressHash));
    }

    get fun get_plugin_list(): map<Address, Bool> {
        return self.extensions;
    }
}