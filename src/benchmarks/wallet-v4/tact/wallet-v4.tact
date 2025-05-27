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
        let addr = sender(); // check gas for ctx

        if (!self.state.extensions.exists(addr)) {
            return;
        }

        throwUnless(LowBalance, myBalance() - context().value >= msg.amount);

        // NOTE: Here and later we use RawMsg with sendRawMessage because
        // in v4 wallet implementation message bodies are stored as slices in the same cell
        // instead of separate cell with ref. Our send built-ins (message, send) doesn't support such serialization
        sendRawMessage(
            RawMsg {
                queryId: msg.queryId,
                op: PluginTakeFunds,
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

        let _ = self.state.extensions.del(addr);

        if (context().bounceable) {
            sendRawMessage(
                RawMsg {
                    queryId: msg.queryId,
                    op: PluginRemove,
                    extra: null,
                    amount: 0,
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

            // throw(0) is idiom to successfully exit current transaction without saving state
            throw(0);
        }

        // deploy and add plugin
        if (msg.op == 1) {
            let deployPlugin = DeployPlugin.fromSlice(msg.payload);

            let addr = newAddress(deployPlugin.wc, deployPlugin.stateInit.hash());
            // cant use deploy here because of only basechain support
            sendRawMessage(
                RawMsgWithDeploy {
                    stateInit: deployPlugin.stateInit,
                    body: deployPlugin.body,
                    amount: deployPlugin.amount,
                    receiver: addr,
                }.toCell(),
                3,
            );

            self.state.extensions.set(addr, true);
        } else if (msg.op == 2) {
            let addPlugin = AddPlugin.fromSlice(msg.payload);

            let addr = newAddress(addPlugin.wc, addPlugin.addrHash);

            self.state.extensions.set(addr, true);

            sendRawMessage(
                RawMsg {
                    queryId: addPlugin.queryId,
                    op: AddPluginAction,
                    extra: null,
                    amount: addPlugin.amount,
                    receiver: addr,
                }.toCell(),
                64,
            );
        } else if (msg.op == 3) {
            // remove plugin
            let removePlugin = RemovePluginStruct.fromSlice(msg.payload);

            let addr = newAddress(removePlugin.wc, removePlugin.addrHash);
            throwUnless(PluginWasNotDeleted, self.state.extensions.del(addr));

            sendRawMessage(
                RawMsg {
                    queryId: removePlugin.queryId,
                    op: RemovePluginAction,
                    extra: null,
                    amount: removePlugin.amount,
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
    // also we need to return it as map of <wc, hash> instead of Address (skip first 4 bytes)
    get fun get_plugin_list(): map<Address, Bool> {
        return self.state.extensions;
    }
}

asm fun setData(data: Cell) { c4 POP }
