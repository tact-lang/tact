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

message(0x7369676E) ExternalSignedRequest {
    walletId: Int as uint32;
    validUntil: Int as uint32;
    seqno: Int as uint32;
    outActions: Cell?;
    hasOtherActions: Bool;
    data: Slice as remaining;
}

// message(0x73696e74) InternalSignedRequest {
//     data: Slice as remaining;
// }

message(0x73696e74) InternalSignedRequest {
    walletId: Int as uint32;
    validUntil: Int as uint32;
    seqno: Int as uint32;
    outActions: Cell?;
    hasOtherActions: Bool;
    data: Slice as remaining;
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

asm extends mutates fun checkAndRemoveAddExtensionPrefix(self: Slice): Bool {x{02} SDBEGINSQ}
asm extends mutates fun checkAndRemoveDeleteExtensionPrefix(self: Slice): Bool {x{03} SDBEGINSQ}
asm extends mutates fun checkAndRemoveSetSignAllowedPrefix(self: Slice): Bool {x{04} SDBEGINSQ}

asm fun hach1(asd: InternalSignedRequest): ExternalSignedRequest {}

contract Wallet with Deployable {
    isSignatureAllowed: Bool;
    seqno: Int as uint32;
    walletId: Int as int32;
    publicKey: Int as uint256;
    extensions: map<Int as uint256, Bool>;

    init(publicKey: Int, walletId: Int, extensions: map<Int as uint256, Bool>) {
        self.isSignatureAllowed = true;
        self.publicKey = publicKey;
        self.seqno = 0;
        self.walletId = walletId;
        self.extensions = extensions;
    }

    inline fun processSignedRequestExternal(msg: ExternalSignedRequest, isExternal: Bool) {
        let signature = msg.toSlice().lastBits(512);
        let signedSlice = msg.toSlice().skipLastBits(512);

        let isSignatureValid = checkSignature(signedSlice.hash(), signature, self.publicKey);
        if (!isSignatureValid) {
            if (isExternal) {
                throw(135);
            } else {
                throw(130);
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
        self.processActions(signedSlice, isExternal, false);
    }

    inline fun processSignedRequestInternal(msg: InternalSignedRequest, isExternal: Bool) {
        let signature = msg.toSlice().lastBits(512);
        let signedSlice = msg.toSlice().skipLastBits(512);

        let isSignatureValid = checkSignature(signedSlice.hash(), signature, self.publicKey);
        if (!isSignatureValid) {
            if (isExternal) {
                throw(135);
            } else {
                throw(130);
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
        self.processActions(signedSlice, isExternal, false);
    }

    /*
    actions has the following structure:

    {
        outActions: Cell?;
        hasOtherActions: Bool;
        actions: Slice as remaining;
    }
    */
    inline fun processActions(actions: Slice, isExternal: Bool, isExtension: Bool) {
        let outActions = actions.loadMaybeRef();
        if (outActions != null) {
            setC5(self.processSendMessages(outActions!!, isExternal));
        }

        if (!actions.loadBool()) {
            return;
        }

        while (true) {
            // check tag, process action, try to load next ref while we can
            let isAddExt = actions.checkAndRemoveAddExtensionPrefix();
            let isDeleteExt = isAddExt ? false :  actions.checkAndRemoveDeleteExtensionPrefix();

            if (isAddExt || isDeleteExt) {
                let addr = parseStdAddress(actions.loadAddress().asSlice());
                let myAddr = parseStdAddress(myAddress().asSlice());

                throwUnless(123, addr.workchain == myAddr.workchain); // force_workcain optimization

                if (isAddExt) {
                    self.extensions.set(addr.address, true);
                } else if (isDeleteExt) {
                    throwUnless(122, self.extensions.del(addr.address));
                    throwIf(222, self.extensions.isEmpty() && !self.isSignatureAllowed);
                }
            } else if (actions.checkAndRemoveSetSignAllowedPrefix()) {
                throwUnless(1, isExtension);
                let res = actions.loadBool();
                throwIf(333, res == self.isSignatureAllowed);
                self.isSignatureAllowed = res;

                if (!self.isSignatureAllowed && self.extensions.isEmpty()) {
                    throw(132);
                }
            } else {
                throw(12333);
            }

            if (actions.refsEmpty()) {
                return;
            }

            actions = actions.preloadRef().beginParse();
        }
    }

    inline fun processSendMessages(outActions: Cell, isExternal: Bool): Cell {
        let cs = outActions.beginParseRaw().data;
        let count = 0;

        while (!cs.empty()) {
            cs.enforceAndRemoveActionSendMsgPrefix();

            throwUnless(1, cs.bits() == 8);
            throwUnless(22, cs.refs() == 2);
            throwIf(3, isExternal && (countTrailingZeroes(cs.preloadBits(7)) > 0));

            cs = cs.preloadRef().beginParseRaw().data;
            count += 1;
        }

        throwUnless(1, count <= 255);
        throwUnless(1, cs.refs() == 0);

        return outActions;
    }

    receive(_: Slice) {
        // Fallback
    }

    receive(msg: InternalExtensionRequest) {
        if (self.extensions.get(parseStdAddress(sender().asSlice()).address) != true) {
            return;
        }
        // require(self.extensions.get(sender()) == true, "Unauthorized extension");
        // self.processActions(msg.actions, false, true);
    }

    receive(msg: InternalSignedRequest) {
        self.processSignedRequestInternal(msg, false);
    }

    external(msg: ExternalSignedRequest) {
        self.processSignedRequestExternal(msg, true);
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
        return self.extensions.exists(addressHash);
    }

    get fun get_extensions(): map<Int as uint256, Bool> {
        return self.extensions;
    }
}