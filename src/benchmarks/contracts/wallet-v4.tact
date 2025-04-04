message(0x64737472) RemovePlugin {
    queryId: Int as uint64;
}

message(0x706c7567) PluginRequestFunds {
    queryId: Int as uint64;
    amount: Int as coins;
    extra: Cell?;
}

message ExternalRequest {
    bundle: SignedBundle;
    walletId: Int as int32;
    validUntil: Int as uint32;
    seqno: Int as uint32;
    op: Int as uint8;
    payload: Slice as remaining;
}

struct RawMsg {
    bits: Int as uint6 = 0x18;
    receiver: Address;
    amount: Int as coins;
    extra: Cell?;
    bits2: Int as uint106 = 0; // 4 + 4 + 64 + 32 + 1 + 1
    op: Int as uint32;
    queryId: Int as uint64;
}

struct RawMsgWithDeploy {
    bits: Int as uint6 = 0x18;
    receiver: Address;
    amount: Int as coins;
    bits2: Int as uint108 = 4 + 2 + 1; // 1 + 4 + 4 + 64 + 32 + 1 + 1 + 1
    stateInit: Cell;
    body: Cell;
}

struct ContractState {
    seqno: Int as uint32;
    walletId: Int as int32;
    publicKey: Int as uint256;
    extensions: map<Address, Bool>;
}

contract WalletV4(
    state: ContractState,
) {
    receive(msg: PluginRequestFunds) {
        let addr = sender(); // check gas for ctx

        if (!self.state.extensions.exists(addr)) {
            return;
        }

        throwUnless(80, myBalance() - context().value >= msg.amount);

        // NOTE: Here and later we use RawMsg with nativeSendMessage because
        // in v4 wallet implementation message bodies are stored as slices in the same cell
        // instead of separate cell with ref. Our send built-ins (message, send) doesn't support such serialization
        nativeSendMessage(
            RawMsg {
                queryId: msg.queryId,
                op: 0x706c7567 | 0x80000000,
                extra: msg.extra,
                amount: msg.amount,
                receiver: addr,
            }.toCell(),
            64,
        );
    }

    receive(msg: RemovePlugin) {
        let addr = sender(); // check gas for ctx

        if (!self.state.extensions.exists(addr)) {
            return;
        }

        self.state.extensions.del(addr);

        if (context().bounceable) {
            nativeSendMessage(
                RawMsg {
                    queryId: msg.queryId,
                    op: 0x64737472 | 0x80000000,
                    extra: null,
                    amount: 0,
                    receiver: addr,
                }.toCell(),
                64,
            );
        }
    }

    external(msg: ExternalRequest) {
        throwIf(36, msg.validUntil < now());
        throwUnless(33, msg.seqno == self.state.seqno);
        throwUnless(34, msg.walletId == self.state.walletId);
        throwUnless(35, msg.bundle.verifySignature(self.state.publicKey));

        acceptMessage();
        self.state.seqno += 1;
        setData(self.state.toCell());
        commit();

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
            nativeSendMessage(
                RawMsgWithDeploy {
                    stateInit,
                    body,
                    amount,
                    receiver: addr,
                }.toCell(),
                3,
            );

            self.state.extensions.set(addr, true);
        } else if (msg.op == 2) {
            // add plugin
            let payload = msg.payload;
            let addr = payload.loadAddress();
            let amount = payload.loadCoins();
            let queryId = payload.loadUint(64);

            self.state.extensions.set(addr, true);

            nativeSendMessage(
                RawMsg {
                    queryId,
                    op: 0x6e6f7465,
                    extra: null,
                    amount,
                    receiver: addr,
                }.toCell(),
                64,
            );
        } else if (msg.op == 3) {
            // remove plugin
            let payload = msg.payload;
            let addr = payload.loadAddress();
            let amount = payload.loadCoins();
            let queryId = payload.loadUint(64);

            throwUnless(39, self.state.extensions.del(addr));

            nativeSendMessage(
                RawMsg {
                    queryId,
                    op: 0x64737472,
                    extra: null,
                    amount: amount,
                    receiver: addr,
                }.toCell(),
                64,
            );
        }
    }

    receive(_: Slice) {
        // Fallback
    }

    get fun seqno(): Int {
        return self.state.seqno;
    }

    get fun get_subwallet_id(): Int {
        return self.state.walletId;
    }

    get fun get_public_key(): Int {
        return self.state.publicKey;
    }

    get fun is_plugin_installed(wc: Int, hash: Int): Bool {
        return self.state.extensions.exists(newAddress(wc, hash));
    }

    // this is different from FunC version, awaiting unbounded tuple impl in Tact
    get fun get_plugin_list(): map<Address, Bool> {
        return self.state.extensions;
    }
}

asm fun setData(data: Cell) { c4 POP }