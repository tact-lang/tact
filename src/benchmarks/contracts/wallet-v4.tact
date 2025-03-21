message(0x64737472) RemovePlugin {
    queryId: Int as uint64;
}

message(0x706c7567) PluginRequestFunds {
    queryId: Int as uint64;
    amount: Int as coins;
    extra: Cell?;
}

message ExternalRequest {
    signature: Slice as bytes64;
    walletId: Int as int32;
    validUntil: Int as uint32;
    seqno: Int as uint32;
    op: Int as uint8;
    payload: Slice as remaining;
}

contract WalletV4(
    seqno: Int as uint32,
    walletId: Int as int32,
    publicKey: Int as uint256,
    extensions: map<Address, Bool>
) {
    receive(msg: PluginRequestFunds) {
        let addr = sender(); // check gas for ctx

        if (!self.extensions.exists(addr)) {
            return;
        }

        throwUnless(80, myBalance() - context().value >= msg.amount);

        nativeSendMessage(beginCell()
            .storeUint(0x18, 6)
            .storeAddress(addr)
            .storeCoins(msg.amount)
            .storeMaybeRef(msg.extra)
            .storeUint(0, 4 + 4 + 64 + 32 + 1 + 1)
            .storeUint(0x706c7567 | 0x80000000, 32)
            .storeUint(msg.queryId, 64)
            .endCell(),
            64
        );
    }

    receive(msg: RemovePlugin) {
        let addr = sender(); // check gas for ctx

        if (!self.extensions.exists(addr)) {
            return;
        }

        self.extensions.del(addr);

        if (context().bounceable) {
            nativeSendMessage(beginCell()
                .storeUint(0x18, 6)
                .storeAddress(addr)
                .storeCoins(0)
                .storeUint(0, 1 + 4 + 4 + 64 + 32 + 1 + 1)
                .storeUint(0x64737472 | 0x80000000, 32)
                .storeUint(msg.queryId, 64)
                .endCell(),
                64
            );
        }
    }

    external(msg: ExternalRequest) {
        throwIf(36, msg.validUntil < now());
        throwUnless(33, msg.seqno == self.seqno);
        throwUnless(34, msg.walletId == self.walletId);
        let msgSlice = msg.toSlice();
        msgSlice.skipBits(32 + 512); // tact receiver op + signature skip
        throwUnless(35, checkSignature(msgSlice.hash(), msg.signature, self.publicKey));

        acceptMessage();
        self.seqno += 1;
        commit(); // NOTE: fix, blocked by #2073

        // simple transfer
        if (msg.op == 0) {
            let payload = msg.payload;
            /*
            foreach (ref in payload.refs) {
                let mode = payload.loadUint(8);
                nativeSendMessage(ref, mode);
            }
            */
            while (payload.refs() > 0) {
                let mode = payload.loadUint(8);
                nativeSendMessage(payload.loadRef(), mode);
            }
            return;
        }

        // deploy and add plugin
        if (msg.op == 1) {
            let payload = msg.payload;
            let wc = payload.loadUint(8);
            let amount = payload.loadCoins();
            let stateInit = payload.loadRef();
            let body = payload.loadRef();
                        
            let addr = newAddress(wc, stateInit.hash());
            // cant use deploy here because of only basechain support
            nativeSendMessage(beginCell()
                .storeUint(0x18, 6)
                .storeAddress(addr)
                .storeCoins(amount)
                .storeUint(4 + 2 + 1, 1 + 4 + 4 + 64 + 32 + 1 + 1 + 1)
                .storeRef(stateInit)
                .storeRef(body)
                .endCell(),
                3
            );

            self.extensions.set(addr, true);
        }

        // add plugin
        if (msg.op == 2) {
            let payload = msg.payload;
            let addr = payload.loadAddress();
            let amount = payload.loadCoins();
            let queryId = payload.loadUint(64);

            self.extensions.set(addr, true);

            nativeSendMessage(beginCell()
                .storeUint(0x18, 6)
                .storeAddress(addr)
                .storeCoins(amount)
                .storeUint(0, 1 + 4 + 4 + 64 + 32 + 1 + 1)
                .storeUint(0x6e6f7465, 32)
                .storeUint(queryId, 64)
                .endCell(),
                3
            );
        }

        // remove plugin
        if (msg.op == 3) {
            let payload = msg.payload;
            let addr = payload.loadAddress();
            let amount = payload.loadCoins();
            let queryId = payload.loadUint(64);

            throwUnless(39, self.extensions.del(addr));

            nativeSendMessage(beginCell()
                .storeUint(0x18, 6)
                .storeAddress(addr)
                .storeCoins(amount)
                .storeUint(0, 1 + 4 + 4 + 64 + 32 + 1 + 1)
                .storeUint(0x64737472, 32)
                .storeUint(queryId, 64)
                .endCell(),
                3
            );
        }
    }
    
    receive(_: Slice) {
        // Fallback
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

    get fun is_plugin_installed(wc: Int, hash: Int): Bool {
        return self.extensions.exists(newAddress(wc, hash));
    }

    // this is different from FunC version, awaiting unbounded tuple impl in Tact
    get fun get_plugin_list(): map<Address, Bool> {
        return self.extensions;
    }
}
