import "@stdlib/deploy";

/*
struct OutActions {
    mode: Int as uint8;
    body: Slice;
}

struct InternalOperation {
    walletId: Int as uint32;
    validUntil: Int as uint32;
    seqno: Int as uint32;
    actions: OutActions as remaining;
}

struct SignedRequest {
    signature: Slice as bytes64;
    operation: InternalOperation as remaining;
}
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

asm fun countTrailingZeroess(s: Slice): Int { SDCNTTRAIL0 }

contract Wallet with Deployable {
    isSignatureAllowed: Bool;
    seqno: Int as uint32;
    walletId: Int as int32;
    publicKey: Int as int256;
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

        // let ds = msg.operation;
        // let walletId: Int = ds.loadInt(32);
        // let validUntil: Int = ds.loadInt(32);
        // let seqno: Int = ds.loadUint(32);

        require(msg.operation.seqno == self.seqno, "Invalid seqno");
        require(msg.operation.walletId == self.walletId, "Invalid walletId");
        require(now() < msg.operation.validUntil, "Operation expired");

        if (isExternal) {
            acceptMessage();
        }

        self.seqno = (self.seqno + 1);

        // Commit state for reply protection
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
                self.extensions.set(actions.loadAddress(), true);
            }

            if (mode == 4) {
                self.extensions.set(actions.loadAddress(), null);
            }
        }
    }

    fun processSendMessages(msg: Slice, isExternal: Bool) {
        let count = 0;

        while(msg.refs() > 0) {
            // enforce that send_mode has +2 bit (ignore errors) set for external message.
            nativeThrowIf(137, isExternal && (countTrailingZeroess(msg.preloadBits(7)) > 0));

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
        return self.extensions.get(newAddress(wc, addressHash)) != null;
    }

    get fun get_plugin_list(): map<Address, Bool> {
        return self.extensions;
    }
}