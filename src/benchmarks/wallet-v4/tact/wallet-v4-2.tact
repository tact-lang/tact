message(0x64737472) RemovePlugin {
    queryId: Int as uint64;
}

message(0x706c7567) PluginRequestFunds {
    queryId: Int as uint64;
    amount: Int as coins;
    extra: Cell?;
}

struct ExtRequest {
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

struct RawMsg2 {
    bits: Int as uint6 = 0x18;
    padding: Int as uint3;
    receiver: Slice as remaining;
    amount: Int as coins;
    extra: Cell?;
    bits2: Int as uint106 = 0; // 4 + 4 + 64 + 32 + 1 + 1
    op: Int as uint32;
    queryId: Int as uint64;
}

struct RawMsgWithDeploy {
    bits: Int as uint6 = 0x18;
    padding: Int as uint3;
    receiver: Slice as remaining;
    amount: Int as coins;
    bits2: Int as uint108 = 4 + 2 + 1; // 1 + 4 + 4 + 64 + 32 + 1 + 1 + 1
    stateInit: Cell;
    body: Cell;
}

struct ContractState {
    seqno: Int as uint32;
    walletId: Int as int32;
    publicKey: Int as uint256;
    extensions: map<Slice, Bool>;
}

struct DeployPlugin {
    wc: Int as uint8;
    amount: Int as coins;
    stateInit: Cell;
    body: Cell;
}

struct AddPlugin {
    wc: Int as uint8;
    addrHash: Int as uint256;
    amount: Int as coins;
    queryId: Int as uint64;
}

struct RemovePluginStruct {
    wc: Int as uint8;
    addrHash: Int as uint256;
    amount: Int as coins;
    queryId: Int as uint64;
}

// Exit codes
const LowBalance: Int = 80;
const Expired: Int = 36;
const SeqnoMismatch: Int = 33;
const WalletIdMismatch: Int = 34;
const SignatureMismatch: Int = 35;
const PluginWasNotDeleted: Int = 39;

// Op
const PluginTakeFunds: Int = 0x706c7567 | 0x80000000;
const PluginRemove: Int = 0x64737472 | 0x80000000;
const AddPluginAction: Int = 0x6e6f7465;
const RemovePluginAction: Int = 0x64737472;

contract WalletV4(
    state: ContractState,
) {
    receive(msg: PluginRequestFunds) {
//        let slice = inMsg();
//        slice.skipBits(4);
        let addr2 = sender();
        let addrParsed = parseStdAddress(addr2.asSlice());
        let wc_n_address = addrParsed.toCell().asSlice();
        let addr = wc_n_address;

        if (!self.state.extensions.exists(addr)) {
            return;
        }

        throwUnless(LowBalance, myBalance() - context().value >= msg.amount);

        // NOTE: Here and later we use RawMsg with sendRawMessage because
        // in v4 wallet implementation message bodies are stored as slices in the same cell
        // instead of separate cell with ref. Our send built-ins (message, send) doesn't support such serialization
        sendRawMessage(
            RawMsg2 {
                queryId: msg.queryId,
                op: PluginTakeFunds,
                extra: msg.extra,
                amount: msg.amount,
                padding: 4,
                receiver: wc_n_address,
            }.toCell(),
            64,
        );
    }

    receive(msg: RemovePlugin) {
        let slice = inMsg();
        slice.skipBits(4);
        let addr2 = slice.loadAddress();
        let addrParsed = parseStdAddress(addr2.asSlice());
        let wc_n_address = addrParsed.toCell().asSlice();
        let addr = wc_n_address;
//        let addr = sender(); // check gas for ctx

        if (!self.state.extensions.exists(addr)) {
            return;
        }

        let _ = self.state.extensions.del(addr);

        if (context().bounceable) {
            sendRawMessage(
                RawMsg2 {
                    queryId: msg.queryId,
                    op: PluginRemove,
                    extra: null,
                    amount: 0,
                    padding: 4,
                    receiver: addr,
                }.toCell(),
                64,
            );
        }
    }

    external(msgSlice: Slice) {
        let msg = ExtRequest.fromSlice(msgSlice);
        throwIf(Expired, msg.validUntil < now());
        throwUnless(SeqnoMismatch, msg.seqno == self.state.seqno);
        throwUnless(WalletIdMismatch, msg.walletId == self.state.walletId);
        throwUnless(SignatureMismatch, msg.bundle.verifySignature(self.state.publicKey));

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
                sendRawMessage(ref, mode);
            }
            */

            while (payload.refs() != 0) {
                let mode = payload.loadUint(8);
                sendRawMessage(payload.loadRef(), mode);
            }
            throw(0);
        }

        // deploy and add plugin
        if (msg.op == 1) {
            let deployPlugin = DeployPlugin.fromSlice(msg.payload);

            let plugin_address = deployPlugin.stateInit.hash();
            let wc_n_address = beginCell()
                .storeInt(deployPlugin.wc, 8)
                .storeUint(plugin_address, 256)
                .endCell().asSlice();

//            let slice = msg.payload;
//            let plugin_workchain = slice.loadUint(8);
//            let wc_n_address = slice.loadBits(8 + 256);
            let addr = wc_n_address;

//            let addr = newAddress(deployPlugin.wc, deployPlugin.stateInit.hash());
            // cant use deploy here because of only basechain support
            sendRawMessage(
                RawMsgWithDeploy {
                    stateInit: deployPlugin.stateInit,
                    body: deployPlugin.body,
                    amount: deployPlugin.amount,
                    padding: 4,
                    receiver: addr,
                }.toCell(),
                3,
            );

            self.state.extensions.set(addr, true);
            // todo: add throw_unless, see FunC code
        } else if (msg.op == 2) {
            let addPlugin = AddPlugin.fromSlice(msg.payload);

            let wc_n_address = msg.payload.loadBits(8 + 256);
            let addr = wc_n_address;
//            let addr = newAddress(addPlugin.wc, addPlugin.addrHash);

            self.state.extensions.set(addr, true);

            sendRawMessage(
                RawMsg2 {
                    queryId: addPlugin.queryId,
                    op: AddPluginAction,
                    extra: null,
                    amount: addPlugin.amount,
                    padding: 4,
                    receiver: addr,
                }.toCell(),
                64,
            );
        } else if (msg.op == 3) {
            // remove plugin
            let removePlugin = RemovePluginStruct.fromSlice(inMsg());

            let wc_n_address = msg.payload.loadBits(8 + 256);
            let addr = wc_n_address;
//            let addr = newAddress(removePlugin.wc, removePlugin.addrHash);
            throwUnless(PluginWasNotDeleted, self.state.extensions.del(addr));

            sendRawMessage(
                RawMsg2 {
                    queryId: removePlugin.queryId,
                    op: RemovePluginAction,
                    extra: null,
                    amount: removePlugin.amount,
                    padding: 4,
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
        let addr = beginCell().storeInt(wc, 8).storeUint(hash, 256).endCell().asSlice();
        return self.state.extensions.exists(addr);
    }

    // this is different from FunC version, awaiting unbounded tuple impl in Tact
    // also we need to return it as map of <wc, hash> instead of Address (skip first 4 bytes)
    get fun get_plugin_list(): map<Slice, Bool> {
        return self.state.extensions;
    }
}

asm fun setData(data: Cell) { c4 POP }
