contract WalletV5(
    isSignatureAllowed: Bool,
    seqno: Int as uint32,
    walletId: Int as int32,
    publicKey: Int as uint256,
    extensions: map<Int as uint256, Bool>
) {
    receive(msg: InternalExtensionRequest) {
        let myAddr = parseStdAddress(myAddress().asSlice());
        let addr = parseStdAddress(sender().asSlice());

        throwUnless(145, addr.workchain == myAddr.workchain); // force_workchain optimization
        throwUnless(148, self.extensions.exists(addr.address));

        self.processActions(msg.actions, false, true);
    }

    receive(msg: InternalSignedRequest) {
        self.processSignedRequestInternal(msg, false);
    }

    receive(_: Slice) {
        // Fallback
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

    get fun get_extensions(): map<Int as uint256, Bool> {
        return self.extensions;
    }
}
