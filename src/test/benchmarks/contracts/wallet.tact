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

message SignedRequest {
    signature: Slice as bytes64;
    operation: InternalOperation;
}

message InternalSignedRequest {
    queryId: Int as uint64;
    signed: SignedRequest;
}

message InternalExtensionRequest {
    actions: Slice as remaining;
}

asm fun countTrailingZeroes(s: Slice): Int { SDCNTTRAIL0 }

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

        self.processActions(msg.operation.actions, isExternal, false);
    }

    fun processActions(actions: Slice, isExternal: Bool, isExtension: Bool) {
        let mode: Int = actions.loadUint(8);

        if (mode == 0) { // multiple actions
            while(actions.refs() > 0) {
                self.processActions(actions.loadRef().beginParse(), isExternal, isExtension);
            }
        } else if (mode == 1) {
            self.processSendMessages(actions, isExternal);
        } else if (mode == 2) {
            require(isExtension, "Only extensions can change signature policy");

            self.isSignatureAllowed = actions.loadBool();
        } else {
            let extensionAddress = actions.loadAddress();
            let parsedExtension = parseStdAddress(extensionAddress.asSlice());
            let parsedOwn = parseStdAddress(myAddress().asSlice());

            require(parsedExtension.workchain == parsedOwn.workchain, "Invalid workchain");

            if (mode == 3) {
                self.extensions.set(extensionAddress, true);
            }
            if (mode == 4) {
                self.extensions.set(extensionAddress, null);
            }
        }
    }

    fun processSendMessages(msg: Slice, isExternal: Bool) {
        let count = 0;

        // action_send_msg#01 mode:(## 8) out_msg:^(MessageRelaxed Any) = ExtendedAction;
        while(msg.refs() > 0) {
            // enforce that send_mode has +2 bit (ignore errors) set for external message.
            nativeThrowIf(137, isExternal && (countTrailingZeroes(msg.preloadBits(7)) > 0));

            let mode: Int = msg.loadInt(8);
            let body: Cell = msg.loadRef();

            nativeSendMessage(body, mode);

            count += 1;
            require(count <= 255, "Exceeded max message count");
        }
    }

    receive(_: Slice) {
        // Fallback
    }

    receive(msg: InternalExtensionRequest) {
        if (self.extensions.get(sender()) != true) {
            return;
        }
        // require(self.extensions.get(sender()) == true, "Unauthorized extension");
        self.processActions(msg.actions, false, true);
    }

    receive(msg: InternalSignedRequest) {
        self.processSignedRequest(msg.signed, false);
    }

    external(msg: SignedRequest) {
        self.processSignedRequest(msg, true);
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